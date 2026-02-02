/// PATCH

/// APPEND
scr_get_temp_draw();
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_mainbig);

if (global.reset_key >= 0)
{
    draw_set_color(c_white);
    var text;
    
    switch (global.reset_key div 20)
    {
        case 0:
            text = "Resetting...";
            break;
        
        case 1:
            text = "Resetting..";
            break;
        
        case 2:
            text = "Resetting.";
            break;
    }
    
    draw_text_outline(5, surface_get_height(application_surface) - 30, text);
}
else
{
    if (global.hits == 0) draw_set_color(c_yellow);
    else draw_set_color(c_white);
    draw_text_outline(5, surface_get_height(application_surface) - 30, "Hits: " + string(global.hits));
}

scr_set_temp_draw();
/// END