/// @description Insert description here
// You can write your code in this editor

switch State {
	case 0:
		image_xscale = 0.3
		image_yscale = 0.3
		//draw_sprite_ext(spr_ufo_arriving, image_index, x, y, image_xscale,  image_yscale, 0, -1, 1);
		draw_self();
		break;
	case 1:
		draw_self();
		break;
	case 2:
	case 3:
	default:
		draw_sprite_ext(spr_ufo_idle, image_index, x, y, 1, 1, image_angle, -1, 1);
		break;
}






