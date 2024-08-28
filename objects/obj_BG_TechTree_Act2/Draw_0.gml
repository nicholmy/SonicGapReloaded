/// @description Draw Many BG Elements

// Inherit the parent event
event_inherited();

// Palette: (Only if we allow Shaders)
/*if(global.Shaders != 0){
    //pal_swap_set(spr_skystation_palette, floor(PalettePosition), false);
}*/

//Skies
scr_draw_background_tiled_area(bg_tt1_sky, 0,  100,  Camera.ViewX * 1,  Camera.ViewY * globalYScroll + 0 + yOffset ,  Camera.ViewX * 0 +  global.Width, 397);

//Mountains & Water
scr_draw_background_tiled_area(bg_tt_mountains, 0,  0,  Camera.ViewX * 0.95,  Camera.ViewY * globalYScroll + 265 - 50 + yOffset ,  Camera.ViewX * 0.05 +  global.Width, 32);
scr_draw_background_tiled_area(bg_tt_water, 0,  0,  Camera.ViewX * 0.9 + (cl_speed * 0.50),  Camera.ViewY * globalYScroll + 297 - 50  + yOffset ,  Camera.ViewX * 0.1 +  global.Width - (cl_speed * 0.50), 188);


scr_draw_background_tiled_area(bg_tt_coaster_yellow, 0,  0,  Camera.ViewX * 0.88,  Camera.ViewY * globalYScroll + 245 - 50  + yOffset ,  Camera.ViewX * 0.12 +  global.Width, 179);


//Back Grass
scr_draw_background_tiled_area(bg_tt_grass1, 0,  0,  Camera.ViewX * 0.87,  Camera.ViewY * globalYScroll + 340 - 50  + yOffset ,  Camera.ViewX * 0.13 +  global.Width, 11);

scr_draw_background_tiled_area(bg_tt_trees, 0,  0,  Camera.ViewX * 0.85,  Camera.ViewY * globalYScroll + 200 - 50  + yOffset ,  Camera.ViewX * 0.15 +  global.Width, 171);

scr_draw_background_tiled_area(bg_tt_grass2, 0,  0,  Camera.ViewX * 0.85,  Camera.ViewY * globalYScroll + 348 - 50  + yOffset ,  Camera.ViewX * 0.15 +  global.Width, 13);
scr_draw_background_tiled_area(bg_tt_grass3, 0,  0,  Camera.ViewX * 0.8,  Camera.ViewY * globalYScroll + 357 - 50  + yOffset ,  Camera.ViewX * 0.2 +  global.Width, 18);
scr_draw_background_tiled_area(bg_tt_grass3, 0,  0,  Camera.ViewX * 0.78,  Camera.ViewY * globalYScroll + 367 - 50  + yOffset ,  Camera.ViewX * 0.2 +  global.Width, 18);
//Coasters
scr_draw_background_tiled_area(bg_tt_coaster_blue, 0,  0,  Camera.ViewX * 0.75,  Camera.ViewY * globalYScroll + 200 - 50 ,  Camera.ViewX * 0.25 +  global.Width, 255);

scr_draw_background_tiled_area(bg_tt_grass4, 0,  0,  Camera.ViewX * 0.75,  Camera.ViewY * globalYScroll + 285 - 50,  Camera.ViewX * 0.3 +  global.Width, 128);

//Front Grass
scr_draw_background_tiled_area(bg_tt_grass4, 0,  0,  Camera.ViewX * 0.72,  Camera.ViewY * globalYScroll + 295 - 50 ,  Camera.ViewX * 0.3 +  global.Width, 128);
scr_draw_background_tiled_area(bg_tt_grass4, 0,  0,  Camera.ViewX * 0.7,  Camera.ViewY * globalYScroll + 305 - 50 ,  Camera.ViewX * 0.3 +  global.Width, 128);

/*
 
// When we modified the palette, make sure to reset it:
      if(global.Shaders != 0){
            pal_swap_reset()
      } */