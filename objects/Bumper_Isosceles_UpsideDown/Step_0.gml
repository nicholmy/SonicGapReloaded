/// @description Insert description here
// You can write your code in this editor
if (Player.Grounded and object_check_player(ColSolidU) and !Player.Hurt and !Player.Death) {
	Player.PosY     += Player.DefaultRadiusY - Player.SmallRadiusY;
	Player.RadiusY   = Player.SmallRadiusY;
	Player.RadiusX	  = Player.SmallRadiusX;
	Player.Spinning  = true;
	Player.Animation = AnimSpin;
	
	// Player should be airborne now
	Player.Grounded = false;
	Player.OnObject = false;
	
	if (Player.x < x) {
		Player.Xsp = -LaunchForce * dcos(60);
	} else if (Player.x > x) {
		Player.Xsp = LaunchForce * dcos(60);
	}
	Player.Ysp = -LaunchForce * dcos(60);
	
	audio_sfx_play(sfxSpring, false);
}

object_act_solid(true, true, true, false);