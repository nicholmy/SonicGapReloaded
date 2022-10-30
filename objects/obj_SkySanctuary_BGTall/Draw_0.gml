/// @description Draw Many Clouds

// Inherit the parent event
event_inherited();

// Palette: (Only if we allow Shaders)
if(global.Shaders != 0){
    pal_swap_set(pal_ss_bg1, floor(PalettePosition), false);
}


 // Draw the Top Clouds (A speed variable is used to help it move separately from the others.)
scr_draw_background_tiled_area(bg_skysanct_clouds1, 0,  0, Camera.ViewX + (cl_speed * 0.40), Camera.ViewY * globalYScroll + 0 , global.Width - (cl_speed * 0.40), 112);

// Big Cloud in the Middle (Top)
scr_draw_background_tiled_area(bg_skysanct_clouds5, 0,  0, Camera.ViewX * 0.9 + (cl_speed * 0.50), Camera.ViewY * globalYScroll + 112 , Camera.ViewX * 0.1 + global.Width - (cl_speed * 0.50), 80);
scr_draw_background_tiled_area(bg_skysanct_clouds5, 0,  80, Camera.ViewX * 0.875 + (cl_speed * 0.60), Camera.ViewY * globalYScroll + 192 , Camera.ViewX * 0.125 + global.Width - (cl_speed * 0.60), 40);

//Middle Clouds
scr_draw_background_tiled_area(bg_skysanct_clouds5, 0,  120, Camera.ViewX * 0.85 + (cl_speed * 0.70), Camera.ViewY * globalYScroll + 232 , Camera.ViewX * 0.15 + global.Width - (cl_speed * 0.70), 176);

//Bottom Part of Big Cloud
scr_draw_background_tiled_area(bg_skysanct_clouds5, 0,  296, Camera.ViewX * 0.875 + (cl_speed * 0.60), Camera.ViewY * globalYScroll + 408 , Camera.ViewX * 0.125 + global.Width - (cl_speed * 0.60), 40);
scr_draw_background_tiled_area(bg_skysanct_clouds5, 0,  336, Camera.ViewX * 0.9 + (cl_speed * 0.50), Camera.ViewY * globalYScroll + 448 , Camera.ViewX * 0.1 + global.Width - (cl_speed * 0.50), 64);

//Skies
scr_draw_background_tiled_area(bg_skysanct_clouds3, 0,  0, Camera.ViewX + (cl_speed * 0.40), Camera.ViewY * globalYScroll + 512 , global.Width - (cl_speed * 0.40), 256);

//Bottom Clouds
scr_draw_background_tiled_area(bg_skysanct_clouds4, 0,  0, Camera.ViewX * 0.9 + (cl_speed * 0.50), Camera.ViewY * globalYScroll + 768 , Camera.ViewX * 0.1 + global.Width - (cl_speed * 0.50), 64);
scr_draw_background_tiled_area(bg_skysanct_clouds4, 0,  64, Camera.ViewX * 0.875 + (cl_speed * 0.60), Camera.ViewY * globalYScroll + 832 , Camera.ViewX * 0.125 + global.Width - (cl_speed * 0.60), 64);

// When we modified the palette, make sure to reset it:
      if(global.Shaders != 0){
            pal_swap_reset()
      }