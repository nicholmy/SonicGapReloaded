/// @description Animate
// You can write your code in this editor

/*
States
0 - Idle
1 - Moving
2 - Ouch
3 - Happy
4 - Dying
5 - Dead
6 - Panic
*/
switch state {
	case 0:
		animation_play(spr_eggmobile_face_idle, 8, 0);
		break;
	case 1:
		animation_play(spr_eggmobile_face_idle, 8, 0);
		break;
	case 2:
		animation_set(spr_eggmobile_face_ouch, 0);
		break;
	case 3:
		animation_play(spr_eggmobile_face_happy, 8, 0);
		break;
	case 4:
		animation_play(spr_eggmobile_face_dying, 24, 0);
		break;
	case 5:
		animation_play(spr_eggmobile_face_dead, 8, 0);
		break;
	case 6:
		animation_play(spr_eggmobile_face_panic, 8, 0);
		break;
	default:
		animation_play(spr_eggmobile_face_idle, 8, 0);
		break;
}

