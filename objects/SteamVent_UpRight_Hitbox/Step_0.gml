/// @description Trigger conditions
// You can write your code in this editor

if (isReady and object_check_player(ColTrigger) and Input.ABCPress) {
	Player.Grounded = false;
	Player.Xsp = 8 * dcos(45);
	Player.Ysp = -8 * dsin(45);
	Player.Animation = AnimSpin;
	Player.ClimbState = false;
	Player.OnObject = false;
	
	var vent = instance_create(x+3, y-5, SteamVent_Up_Jet);
	vent.image_angle = 315;
	audio_sfx_play(sfxVentJet, false);
	
	isReady = false;
	alarm[0] = 15;
}

