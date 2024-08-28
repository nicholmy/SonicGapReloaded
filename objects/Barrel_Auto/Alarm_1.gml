/// @description Shoot the player
// You can write your code in this editor
if (state == 1) {
	state = 2;
	alarm[0] = cooldownLength;
	Player.Xsp = 10 * dcos(image_angle);
	Player.Ysp = 10 * -dsin(image_angle);
	Player.DustTimer = 30;
	Camera.Target = Player;
	audio_sfx_play(sfxBarrelShoot, false);
}