/// @description Shoot via button
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (state == 1 and Input.ABCPress) {
	state = 2;
	alarm[0] = cooldownLength;
	Player.Xsp = 10 * dcos(image_angle);
	Player.Ysp = 10 * -dsin(image_angle);
	Player.DustTimer = 30;
	
	audio_sfx_play(sfxBarrelShoot, false);
	Camera.Target = Player;
}

