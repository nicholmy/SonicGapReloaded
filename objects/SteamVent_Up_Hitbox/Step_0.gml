/// @description Trigger conditions
// You can write your code in this editor

if (isReady and object_check_player(ColTrigger)) {
	if (Input.ABCPress) {
		Player.Grounded = false;
		Player.Ysp = -7;
		Player.Animation = AnimSpin;
		Player.ClimbState = false;
		Player.OnObject = false;
		instance_create(x,y, SteamVent_Up_Jet);
		audio_sfx_play(sfxVentJet, false);
	
		// Disable the jet for 15 frames
		isReady = false;
		alarm[0] = 15;
	} else if (Player.GlideState == GlideAir) {
		Player.Ysp = -5;
		instance_create(x,y, SteamVent_Up_Jet);
		audio_sfx_play(sfxVentJet, false);
		
		isReady = false;
		alarm[0] = 15;
	}
}

