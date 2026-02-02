/// PATCH

/// AFTER
        draw_set_alpha(0.4);
        draw_set_color(c_white);
/// CODE
#if CHAPTER_1 || CHAPTER_2
        draw_text_transformed(247, 6, "Hit Counter Mod " + scr_get_mod_version(), 0.5, 0.5, 0);
#else 
        draw_text_transformed(247, 6, "Hit Counter Mod v" + scr_get_mod_version(), 0.5, 0.5, 0);
#endif
/// END