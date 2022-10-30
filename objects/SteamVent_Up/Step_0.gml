/// @description Pop the player up if they land on top

// Do collision
object_act_solid(false, true, false, false);

if (object_check_player(ColSolidU)) {
	Player.Grounded = false;
	Player.Ysp = -4;
	Player.Animation = AnimHurt;
	Player.ClimbState = false;
	Player.OnObject = false;
	instance_create(x, y-20, SteamVent_Up_Tap);
	audio_sfx_play(sfxVentTap, false);
}
