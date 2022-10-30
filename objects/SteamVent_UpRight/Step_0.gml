/// @description Pop the player up-right if they land on top

// Do collision
object_act_solid(false, true, false, false);

if (object_check_player(ColSolidU)) {
	Player.Grounded = false;
	// Not being realistic so the player has time to react
	Player.Xsp = 4 
	Player.Ysp = -4
	Player.Animation = AnimHurt;
	Player.ClimbState = false;
	Player.OnObject = false;
	var vent = instance_create(x+10, y-16, SteamVent_Up_Tap);
	vent.image_angle = 315;
	audio_sfx_play(sfxVentTap, false);
}
