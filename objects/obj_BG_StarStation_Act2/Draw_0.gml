/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*
 // Draw the Clouds (A speed variable is used to help it move separately from the others.)
scr_draw_background_tiled_area(bg_skysanct_clouds_act2_1, 0,  0, Camera.ViewX + (cl_speed * 0.50), Camera.ViewY * globalYScroll + 0 , global.Width - (cl_speed * 0.50), 112);

// Big Cloud in the Middle (Top)
scr_draw_background_tiled_area(bg_skysanct_clouds_act2_2, 0,  0, Camera.ViewX * 0.9 + (cl_speed * 0.50), Camera.ViewY * globalYScroll + 112 , Camera.ViewX * 0.1 + global.Width - (cl_speed * 0.50), 64);
scr_draw_background_tiled_area(bg_skysanct_clouds_act2_2, 0,  64, Camera.ViewX * 0.875 + (cl_speed * 0.60), Camera.ViewY * globalYScroll + 176 , Camera.ViewX * 0.125 + global.Width - (cl_speed * 0.60), 64);
*/

 // Draw the Clouds (A speed variable is used to help it move separately from the others.)
scr_draw_background_tiled_area(bg_skysanct_clouds_act2_1, 0,  0, Camera.ViewX + (cl_speed * 0.40), Camera.ViewY * globalYScroll + 0 , global.Width - (cl_speed * 0.50), 112);
scr_draw_background_tiled_area(bg_skysanct_clouds_act2_1, 0,  0, Camera.ViewX + (cl_speed * 0.50), Camera.ViewY * globalYScroll + 112 , global.Width - (cl_speed * 0.50), 112);

// Big Cloud in the Middle (Top)
scr_draw_background_tiled_area(bg_skysanct_clouds_act2_2, 0,  0, Camera.ViewX * 0.9 + (cl_speed * 0.50), Camera.ViewY * globalYScroll + 212 , Camera.ViewX * 0.1 + global.Width - (cl_speed * 0.50), 64);
scr_draw_background_tiled_area(bg_skysanct_clouds_act2_2, 0,  64, Camera.ViewX * 0.875 + (cl_speed * 0.60), Camera.ViewY * globalYScroll + 276 , Camera.ViewX * 0.125 + global.Width - (cl_speed * 0.60), 64);