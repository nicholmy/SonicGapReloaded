/// @description Insert description here
// You can write your code in this editor
object_act_solid(true, true, true, false);

if (!state and object_check_player(ColSolidL) and Player.Grounded  and !Player.Death and !Player.Hurt) {
	state = 1;
	
	Player.Xsp	      = -10;
	Player.Facing     = -1;	
	
	
	Player.Gsp		  = Player.Xsp;
	Player.Pushing    = false;
	Player.GroundLock = 16;
	
	Player.PosY     += Player.DefaultRadiusY - Player.SmallRadiusY;
	Player.RadiusY   = Player.SmallRadiusY;
	Player.RadiusX	  = Player.SmallRadiusX;
	Player.Spinning  = true;
	Player.Animation = AnimSpin;
	
	alarm[0] = 10;
	audio_sfx_play(sfxSpring, false);
}

if (!state and object_check_player(ColSolidR) and Player.Grounded  and !Player.Death and !Player.Hurt) {
	state = 2;
	
	Player.Xsp	      = 10;
	Player.Facing     = 1;	
	
	
	Player.Gsp		  = Player.Xsp;
	Player.Pushing    = false;
	Player.GroundLock = 16;
	
	Player.PosY     += Player.DefaultRadiusY - Player.SmallRadiusY;
	Player.RadiusY   = Player.SmallRadiusY;
	Player.RadiusX	  = Player.SmallRadiusX;
	Player.Spinning  = true;
	Player.Animation = AnimSpin;
	
	alarm[0] = 10;
	audio_sfx_play(sfxSpring, false);
}

