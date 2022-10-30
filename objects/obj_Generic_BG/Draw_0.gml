/// @description  Draw the Background.

 // Draw the Colored Background (Doing it this way saves up more memory than drawing the color in the room, which fills the entire room.)
    draw_set_color( make_color_rgb(32, 0, 160) );
    draw_rectangle(Camera.ViewX, Camera.ViewY, Camera.ViewX+global.Width, Camera.ViewY + global.Height, false);
    draw_set_color(c_white);

 // Draw the Stars (A speed variable is used to help it move separately from the others.)
    //scr_draw_background_tiled_area(bg_doomsday_stars, 0,  0, Camera.ViewX + (cl_speed * 0.50), Camera.ViewY * 0.97 + 0 , global.Width - (cl_speed * 0.50), 177);
	
 // Draw the Clouds
    //scr_draw_background_tiled_area(bg_doomsday_planet1, 0, 0, Camera.ViewX + (cl_speed * 0.60), Camera.ViewY * 0.97 + 177, global.Width - (cl_speed * 0.60), 47);
    //scr_draw_background_tiled_area(bg_doomsday_planet2, 0, 0, Camera.ViewX + (cl_speed * 0.70), Camera.ViewY * 0.97 + 224, global.Width - (cl_speed * 0.70), 62);
	//scr_draw_background_tiled_area(bg_doomsday_planet3, 0, 0, Camera.ViewX + (cl_speed * 0.80), Camera.ViewY * 0.97 + 286, global.Width - (cl_speed * 0.80), 84);