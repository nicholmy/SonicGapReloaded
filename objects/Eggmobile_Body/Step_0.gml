/// @description Animate
// You can write your code in this editor

/*
States
0 - Normal
1 - Hit
2 - Exploding
*/
switch state {
	case 0:
		animation_play(spr_eggmobile_body_idle, 8, 0);
		break;
	case 1:
		animation_play(spr_eggmobile_body_idle_flash, 2, 0);
		break;
	case 2:
		animation_play(spr_eggmobile_body_idle, 8, 0);
		
		if (explosionTimer mod 8 == 0) {
			instance_create_depth(random_range(x - 32, x + 32), random_range(y - 16, y + 16), depth - 1, FireExplosion)
			audio_sfx_play(sfxExplosion, false);
		}
		explosionTimer++
	default:
		animation_play(spr_eggmobile_body_idle, 8, 1);
		break;
}

