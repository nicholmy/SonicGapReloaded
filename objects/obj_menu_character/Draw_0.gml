/// @description Draw the current character
switch global.Character
{
	case CharSonic:
		draw_sprite(spr_sonic_idle, 3, x,y);
	break;
	case CharTails:
		draw_sprite(spr_tails_balance, 0, x, y);
	break;
	case CharKnuckles:
		draw_sprite(spr_knuckles_idle, 17, x, y);
	break;
	case CharMighty:
		draw_sprite(spr_mighty_goal, 10, x, y+6);
	break;
}



