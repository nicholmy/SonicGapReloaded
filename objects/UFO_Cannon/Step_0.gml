/// @description Shoot the Cannon
// You can write your code in this editor

if (Active and State >= 8) {
	// Shoot the cannon
	instance_create(x-32, y-32, UFO_Cannonball);
	Active = false;
	animation_play(spr_ufo_cannon_shoot, 8, 8);
	alarm[1] = 60;
	audio_sfx_play(sfxExplosion, false);
}







