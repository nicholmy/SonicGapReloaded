/// @description Insert description here
// You can write your code in this editor
animation_play(sprite_index, 8, 0);
if (object_check_player(ColHitbox)) {
	if (!Player.Hurt and !Player.Death) {
		if (Player.RayFlightState) {
			Player.Facing = 1;
			Player.PosX += 2;
		} else {
			if (Player.Grounded) {
				if (Player.CollisionMode[0] == 0) {
					Player.Gsp += (Player.Gsp >= 0) ? 0.3 : 0.06 
				} else if (Player.CollisionMode[0] == 2) {
					Player.Gsp -= (Player.Gsp >= 0) ? 0.06 : 0.3
				}
			} else {
				if (Player.Xsp >= 0) Player.Xsp += 0.3 
				if (Player.Xsp < 0) Player.Xsp += 0.06
			}
		}
	}
	if (!audio_sfx_is_playing(sfxAccelerator)) audio_sfx_play(sfxAccelerator, false)
}

/*
if (other.Action != ActionHurt && other.Action != ActionDie) {
	if (other.Action == ActionSquirrelGlide) {
		if (isRight) {
			other.AnimationDirection = 1;
			other.x = other.x + 2;
		} else {
			other.AnimationDirection = -1;
			other.x = other.x - 2;
		}
	} else {
		if (isRight) {
			if (other.XSpeed >= 0) other.XSpeed += 0.3 
			if (other.XSpeed < 0) other.XSpeed += 0.06
		} else {
			if (other.XSpeed >= 0) other.XSpeed -= 0.06 
			if (other.XSpeed < 0) other.XSpeed -= 0.3
		}
	}
	


	if (soundTimer == 0) PlaySound(snd_object_accelerator, global.SFXVolume, 1, 1);
	soundTimer = 20
}
*/




