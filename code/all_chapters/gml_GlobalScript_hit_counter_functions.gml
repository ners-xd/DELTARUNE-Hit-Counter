/// IMPORT

function scr_get_mod_version()
{
    return "1.02";
}

function scr_setup_hit_counter()
{
    scr_load_hits();
    global.hits_frame_delay = -1;
    global.reset_key = -1;
    #if CHAPTER_2
    global.teacupshit = false;
    #elsif CHAPTER_3
    global.knight_swords_hit = false;
    #elsif CHAPTER_4
    global.forcedswords = false;
    global.balthizard_clouds = false;
    #endif
}

function scr_get_temp_draw()
{
    temp_halign = draw_get_halign();
    temp_valign = draw_get_valign();
    temp_font = draw_get_font();
    temp_alpha = draw_get_alpha();
    temp_color = draw_get_color();
}

function scr_set_temp_draw()
{
    draw_set_halign(temp_halign);
    draw_set_valign(temp_valign);
    draw_set_font(temp_font);
    draw_set_alpha(temp_alpha);
    draw_set_color(temp_color);
}

// This function already exists in Chapter 2+ but we have to add it for Chapter 1
#if CHAPTER_1
function draw_text_outline(text_x, text_y, text, text_color = c_black)
{
    var reset_color = draw_get_color();
    draw_set_color(text_color);
    draw_text(text_x - 1, text_y, text);
    draw_text(text_x - 1, text_y - 1, text);
    draw_text(text_x - 1, text_y + 1, text);
    draw_text(text_x + 1, text_y, text);
    draw_text(text_x + 1, text_y + 1, text);
    draw_text(text_x + 1, text_y - 1, text);
    draw_text(text_x, text_y + 1, text);
    draw_text(text_x, text_y - 1, text);
    draw_set_color(reset_color);
    draw_text(text_x, text_y, text);
}
#endif

function scr_load_hits()
{
    global.hits = 0;
    
    if (file_exists("hits.json"))
    {
        var file = file_text_open_read("hits.json");
        var json = json_parse(file_text_read_string(file));
        file_text_close(file);
        
        if (variable_struct_exists(json, "hits"))
            global.hits = json.hits;
    }
}


function scr_save_hits()
{
    var file = file_text_open_write("hits.json");
    var data = {};
    data.hits = global.hits;

    file_text_write_string(file, json_stringify(data));
    file_text_close(file);
}

function scr_reset_hits()
{
    global.hits = 0;

    scr_save_hits();
}

function scr_add_hit()
{   
#if CHAPTER_2
    if (room == room_dw_mansion_b_west_2f && !global.teacupshit)
    {
        global.teacupshit = true;
        global.hits++;
        scr_save_hits();
    }
    else if (room != room_dw_mansion_b_west_2f)
#elsif CHAPTER_3
    if (instance_exists(obj_tenna_enemy) && instance_exists(obj_elnina_umbrella) && !obj_tenna_enemy.minigameinsanitydamage)
        exit;

    if (instance_exists(obj_knight_enemy) && instance_exists(obj_sword_tunnel_manager) && obj_sword_tunnel_manager.con == 0 && !global.knight_swords_hit)
    {
        global.knight_swords_hit = true;
        global.hits++;
        scr_save_hits();
    }
    else if (!global.knight_swords_hit)
#elsif CHAPTER_4
    if (global.forcedswords)
        exit;
#endif

    // The idea here is when you get hit, wait a frame to see the difference in hits
    // and if it's greater than 1, only count 1.
    // There's no point where more than 1 hit should intentionally count.
    if (global.hits_frame_delay == -1)
    {
        global.prev_hits = global.hits;
        global.hits_frame_delay = call_later(1, time_source_units_frames, function()
        {
            global.hits = global.prev_hits + 1;
            global.hits_frame_delay = -1;
            scr_save_hits();
        });
    }
}
