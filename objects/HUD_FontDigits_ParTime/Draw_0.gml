/// @description Draw the Font (All caps)
// You can write your code in this editor
	switch alignMode {
		case -1:
			draw_set_halign(fa_left);
		break;
		case 0:
			draw_set_halign(fa_center);
		break;
		case 1:
			draw_set_halign(fa_right);
		break;
	}
	draw_set_valign(fa_middle);
	draw_set_font(Font.FontDigits1);
	draw_set_color(c_white);
	
	
	
	var frametime = global.CourseTargets[global.LastCourseID][0];
	
	var Min	= frametime div 3600;
	var Sec	= (frametime - Min * 3600) div 60;
	var Msc = floor(frametime mod 60 / 3 * 5);
	
	var TimeString = string(Min) + "'" + (Sec > 9 ? "" : "0") + string(Sec) + ";" + (Msc > 9 ? "" : "0") + string(Msc);
	
	draw_text(x, y, string(TimeString)) 
	draw_set_valign(fa_top);