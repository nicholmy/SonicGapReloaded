/// @description State Management
// You can write your code in this editor
/*
State
0 - Invisible
1 - Visible, Honing on Player (Small), Slow Sounds
2 - Honing on Player (Small), Faster Sounds
3 - Faster Sounds, Honing on Player (Large)
4 - Animation Change, Stops Following the Player
5 - Shot is out
6 - Shot is disappearing
*/
switch State {
	case 0:
		followPlayer = true;
		object_set_hitbox(0, 0);
		visible = false;
		image_xscale = 1;
		image_yscale = 1;
		animation_play(spr_ufo_target_honing, 8, 0);
		break;
	case 1:
		followPlayer = true;
		object_set_hitbox(0, 0);
		visible = true;
		break;
	case 2:
		followPlayer = true;
		object_set_hitbox(0, 0);
		animation_play(spr_ufo_target_honing, 2, 0);
		break;
	case 3:
		followPlayer = true;
		object_set_hitbox(0, 0);
		image_xscale = 2;
		image_yscale = 2;
		break;
	case 4:
		followPlayer = false;
		object_set_hitbox(0, 0);
		animation_play(spr_ufo_target_locked, 4, 0);
		break;
	case 5:
		followPlayer = false;
		object_set_hitbox(28, 28);
		animation_play(spr_ufo_target_explosion, 4, 0);
		break;
	case 6:
		followPlayer = false;
		object_set_hitbox(0, 0);
		animation_play(spr_ufo_target_explosion_disappearing, 4, 5);
		break;
	default:
		followPlayer = false;
		object_set_hitbox(0, 0);
		break;
}

if (shootTimer < 120) {
	State = 0;
} else if (shootTimer < 240) {
	if (shootTimer % 30 == 0) audio_sfx_play(sfxSwitch, false);
	State = 1;
} else if (shootTimer < 320) {
	if (shootTimer % 10 == 0) audio_sfx_play(sfxSwitch, false);
	State = 2;
} else if (shootTimer < 400) {
	if (shootTimer % 10 == 0) audio_sfx_play(sfxSwitch, false);
	State = 3;
} else if (shootTimer < 470) {
	State = 4;
} else if (shootTimer < 520) {
	if (shootTimer == 470) audio_sfx_play(sfxExplosion, false);
	State = 5;
} else if (shootTimer < 600) {
	State = 6;
} else {
	State = 0;
	shootTimer = 0;
}

// To follow the original timing of the UFO from SAtS
shootTimer += 2;

if (object_check_player(ColHitbox)) {
	player_damage(false, false, false);
}








