/// @description Draw Many BG Elements

// Inherit the parent event
event_inherited();

// Palette: (Only if we allow Shaders)
/*if(global.Shaders != 0){
    //pal_swap_set(spr_skystation_palette, floor(PalettePosition), false);
}*/

//Skies
scr_draw_background_tiled_area(bg_tt1_sky, 0,  0,  Camera.ViewX * 1,  Camera.ViewY * globalYScroll + 0 + yOffset ,  Camera.ViewX * 0 +  global.Width, 394);
scr_draw_background_tiled_area(bg_tt1_sky, 0,  0,  Camera.ViewX * 1,  Camera.ViewY * globalYScroll + 394 + yOffset ,  Camera.ViewX * 0 +  global.Width, 394);

//scr_draw_background_tiled_area(bg_tt1_tree4, 0, 0,  Camera.ViewX * 0.9,  Camera.ViewY * (globalYScroll - 0.0) + 100 + yOffset ,  Camera.ViewX * 0.1 +  global.Width, 322);
//scr_draw_background_tiled_area(bg_tt1_tree4, 0, 0,  Camera.ViewX * 0.8,  Camera.ViewY * (globalYScroll - 0.1) + 200 + yOffset ,  Camera.ViewX * 0.2 +  global.Width, 322);
//scr_draw_background_tiled_area(bg_tt1_tree1, 0, 0,  Camera.ViewX * 0.7,  Camera.ViewY * (globalYScroll - 0.2) + 350 + yOffset ,  Camera.ViewX * 0.3 +  global.Width, 643);
//scr_draw_background_tiled_area(bg_tt1_tree1, 0, 0,  Camera.ViewX * 0.9,  Camera.ViewY * (globalYScroll) + 450 + yOffset ,  Camera.ViewX * 0.4 +  global.Width, 643);



scr_draw_background_tiled_area(bg_tt1_tree4, 0, 0,  Camera.ViewX * 0.9,  Camera.ViewY * (globalYScroll - 0.0) + 300 + yOffset ,  Camera.ViewX * 0.1 +  global.Width, 322);

scr_draw_background_tiled_area(bg_tt1_tree4, 0, 0,  Camera.ViewX * 0.8,  Camera.ViewY * (globalYScroll - 0.0) + 350 + yOffset ,  Camera.ViewX * 0.2 +  global.Width, 322);

scr_draw_background_tiled_area(bg_tt1_tree1, 0, 0,  Camera.ViewX * 0.7,  Camera.ViewY * (globalYScroll - 0.0) + 100 + yOffset ,  Camera.ViewX * 0.3 +  global.Width, 643);
/*
scr_draw_background_tiled_area(bg_tt1_tree1, 0, 0,  Camera.ViewX * 0.6,  Camera.ViewY * (globalYScroll - 0.3) + 450 + yOffset ,  Camera.ViewX * 0.4 +  global.Width, 643);
*/


/*
scr_draw_background_tiled_area(bg_tt_coaster_yellow, 0,  0,  Camera.ViewX * 0.88,  Camera.ViewY * globalYScroll + 225 ,  Camera.ViewX * 0.12 +  global.Width, 179);


//Back Grass
scr_draw_background_tiled_area(bg_tt_grass1, 0,  0,  Camera.ViewX * 0.87,  Camera.ViewY * globalYScroll + 320 ,  Camera.ViewX * 0.13 +  global.Width, 11);

scr_draw_background_tiled_area(bg_tt_trees, 0,  0,  Camera.ViewX * 0.85,  Camera.ViewY * globalYScroll + 200 ,  Camera.ViewX * 0.15 +  global.Width, 171);

scr_draw_background_tiled_area(bg_tt_grass2, 0,  0,  Camera.ViewX * 0.85,  Camera.ViewY * globalYScroll + 328 ,  Camera.ViewX * 0.15 +  global.Width, 13);
scr_draw_background_tiled_area(bg_tt_grass3, 0,  0,  Camera.ViewX * 0.8,  Camera.ViewY * globalYScroll + 337 ,  Camera.ViewX * 0.2 +  global.Width, 18);

//Coasters
scr_draw_background_tiled_area(bg_tt_coaster_blue, 0,  0,  Camera.ViewX * 0.75,  Camera.ViewY * globalYScroll + 200 ,  Camera.ViewX * 0.25 +  global.Width, 255);

//Front Grass
scr_draw_background_tiled_area(bg_tt_grass4, 0,  0,  Camera.ViewX * 0.7,  Camera.ViewY * globalYScroll + 345 ,  Camera.ViewX * 0.3 +  global.Width, 128);
*/