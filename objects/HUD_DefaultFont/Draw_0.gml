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
	draw_set_font(Font.FontDefault);
	draw_set_color(c_white);
	

	draw_text(x, y, message); 