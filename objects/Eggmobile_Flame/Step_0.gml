/// @description Animate
// You can write your code in this editor

/*
States
0 - Nothing
1 - Small Flame
2 - Large Flame
3 - Burst Flame
*/
switch state {
	case 0:
		visible = false;
		break;
	case 1:
		visible = true;
		animation_play(spr_eggmobile_flame, 8, 2);
		break;
	case 2:
		visible = true;
		animation_play(spr_eggmobile_flame, 8, 1);
		break;
	case 3:
		visible = true;
		animation_play(spr_eggmobile_flame_burst, 4, 1);
		break;
	default:
		visible = true;
		animation_play(spr_eggmobile_flame, 8, 2);
		break;
}

