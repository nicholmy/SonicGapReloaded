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


scr_draw_background_tiled_area(bg_tt_coaster_yellow, 0,  0,  Camera.ViewX * 0.88,  Camera.ViewY * globalYScroll + 225 - 50  + yOffset ,  Camera.ViewX * 0.12 +  global.Width, 179);


//Back Grass
scr_draw_background_tiled_area(bg_tt_grass1, 0,  0,  Camera.ViewX * 0.87,  Camera.ViewY * globalYScroll + 320 - 50  + yOffset ,  Camera.ViewX * 0.13 +  global.Width, 11);

scr_draw_background_tiled_area(bg_tt_trees, 0,  0,  Camera.ViewX * 0.85,  Camera.ViewY * globalYScroll + 200 - 50  + yOffset ,  Camera.ViewX * 0.15 +  global.Width, 171);

scr_draw_background_tiled_area(bg_tt_grass2, 0,  0,  Camera.ViewX * 0.85,  Camera.ViewY * globalYScroll + 328 - 50  + yOffset ,  Camera.ViewX * 0.15 +  global.Width, 13);
scr_draw_background_tiled_area(bg_tt_grass3, 0,  0,  Camera.ViewX * 0.8,  Camera.ViewY * globalYScroll + 337 - 50  + yOffset ,  Camera.ViewX * 0.2 +  global.Width, 18);

//Coasters
scr_draw_background_tiled_area(bg_tt_coaster_blue, 0,  0,  Camera.ViewX * 0.75,  Camera.ViewY * globalYScroll + 200 - 50 ,  Camera.ViewX * 0.25 +  global.Width, 255);

//Front Grass
scr_draw_background_tiled_area(bg_tt_grass4, 0,  0,  Camera.ViewX * 0.7,  Camera.ViewY * globalYScroll + 345 - 50 ,  Camera.ViewX * 0.3 +  global.Width, 128);

/*
 // Draw the Treetops
    scr_draw_background_tiled_area(bg_aquaticruin_treetop, 0,  0,  Camera.ViewX * 0.9,  Camera.ViewY * globalYScroll + 0 ,  Camera.ViewX * 0.1 +  global.Width, 128);
	scr_draw_background_tiled_area(bg_aquaticruin_sky, 0,  0,  Camera.ViewX * 1,  Camera.ViewY * globalYScroll + 128 ,  Camera.ViewX * 0 +  global.Width, 128);
	
	scr_draw_background_tiled_area(bg_aquaticruin_mountain, 0,  0,  Camera.ViewX * 0.9,  Camera.ViewY * globalYScroll + 256 ,  Camera.ViewX * 0.1 +  global.Width, 48);
	
	scr_draw_background_tiled_area(bg_aquaticruin_mountain, 0,  48,  Camera.ViewX * 0.8,  Camera.ViewY * globalYScroll + 304 ,  Camera.ViewX * 0.2 +  global.Width, 34);
	
	scr_draw_background_tiled_area(bg_aquaticruin_mountain, 0,  82,  Camera.ViewX * 0.75,  Camera.ViewY * globalYScroll + 338 ,  Camera.ViewX * 0.25 +  global.Width, 46);
	scr_draw_background_tiled_area(bg_aquaticruin_bushes, 0,  0,  Camera.ViewX * 0.75,  Camera.ViewY * globalYScroll + 384 ,  Camera.ViewX * 0.25 +  global.Width, 16);
	
	scr_draw_background_tiled_area(bg_aquaticruin_bushes, 0,  16,  Camera.ViewX * 0.7,  Camera.ViewY * globalYScroll + 400 ,  Camera.ViewX * 0.3 +  global.Width, 48);
	scr_draw_background_tiled_area(bg_aquaticruin_depths, 0,  0,  Camera.ViewX * 0.7,  Camera.ViewY * globalYScroll + 448 ,  Camera.ViewX * 0.3 +  global.Width, 512);

// When we modified the palette, make sure to reset it:
      if(global.Shaders != 0){
            pal_swap_reset()
      } */