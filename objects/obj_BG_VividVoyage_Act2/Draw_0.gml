/// @description Draw Many BG Elements

// Inherit the parent event
event_inherited();

// Palette: (Only if we allow Shaders)
/*if(global.Shaders != 0){
    //pal_swap_set(spr_skystation_palette, floor(PalettePosition), false);
}*/

//Skies
scr_draw_background_tiled_area(bg_vv2_sky1, 0,  0,  Camera.ViewX * 1 + (cl_speed * 0.40),  Camera.ViewY * globalYScroll + 0 + yOffset ,   global.Width - (cl_speed * 0.50), 135);

scr_draw_background_tiled_area(bg_vv2_buildings1, 0,  0,  Camera.ViewX * 0.9 + (cl_speed * 0.50),  Camera.ViewY * globalYScroll + 50 + yOffset ,   global.Width - (cl_speed * 0.70), 144);
scr_draw_background_tiled_area(bg_vv2_buildings2, 0,  0,  Camera.ViewX * 0.85 + (cl_speed * 0.50),  Camera.ViewY * globalYScroll + 75 + yOffset ,   global.Width - (cl_speed * 0.70), 135);
scr_draw_background_tiled_area(bg_vv2_buildings3, 0,  0,  Camera.ViewX * 0.8 + (cl_speed * 0.50),  Camera.ViewY * globalYScroll + 100 + yOffset ,   global.Width - (cl_speed * 0.70), 135);
//scr_draw_background_tiled_area(bg_vv2_sky2, 0,  0,  Camera.ViewX * 0.9 + (cl_speed * 0.40),  Camera.ViewY * globalYScroll + 50 + yOffset ,   global.Width - (cl_speed * 0.50), 144);

//scr_draw_background_tiled_area(bg_vv2_road1, 0,  0,  Camera.ViewX * 0.7 + (cl_speed * 0.40),  Camera.ViewY * globalYScroll + 90 + yOffset ,   global.Width - (cl_speed * 0.50), 135);
//scr_draw_background_tiled_area(bg_vv2_road2, 0,  0,  Camera.ViewX * 0.7 + (cl_speed * 0.40),  Camera.ViewY * globalYScroll + 90 + yOffset ,   global.Width - (cl_speed * 0.50), 135);

scr_draw_background_tiled_area(bg_vv2_sewer1, 0,  0,  Camera.ViewX * 0.6 + (cl_speed * 0.60),  Camera.ViewY * globalYScroll + 200 + yOffset ,   global.Width - (cl_speed * 0.90), 48);
scr_draw_background_tiled_area(bg_vv2_sewer2, 0,  0,  Camera.ViewX * 0.6 + (cl_speed * 0.60),  Camera.ViewY * globalYScroll + 248 + yOffset ,   global.Width - (cl_speed * 0.90), 144);