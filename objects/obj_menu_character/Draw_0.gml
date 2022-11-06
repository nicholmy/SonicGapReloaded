/// @description Draw the current character
switch global.Character
{
	case CharSonic:
		draw_sprite(spr_sonic_idle, 3, x,y);
	break;
	case CharTails:
		draw_sprite(spr_tails_tail_idle, 0, x, y+4);
		draw_sprite(spr_tails_idle, 11, x, y+4);
	break;
	case CharKnuckles:
		draw_sprite(spr_knuckles_idle, 28, x, y);
	break;
	case CharMighty:
		draw_sprite(spr_mighty_goal, 10, x, y);
	break;
	case CharRay:
		draw_sprite(spr_ray_idle, 19, x, y-1);
	break;
}



