/// @description Insert description here
// You can write your code in this editor

if (!state and !lockTimer and !Player.Hurt and !Player.Death and object_check_player(ColHitbox)) {
	state = 1;
	object_set_depth(Player, true);
	Player.PosX = x;
	Player.PosY = y-2;
	Player.Animation = AnimSpin;
	Player.GlideState = 0;
	Player.ClimbState = 0;
	Player.FlightState = 0;
	Player.RayFlightState = 0;
	Player.HammerState = 0;
	Player.Spinning = true;

	alarm[0] = 15;
}

if (state) {
	Player.AirLock = true;
	Player.PosX = x;
	Player.PosY = y-2;
	Player.Xsp = 0;
	Player.Ysp = 0;
	
	Player.Animation = AnimSpin;
	Player.GlideState = 0;
	Player.ClimbState = 0;
	Player.FlightState = 0;
	Player.RayFlightState = 0;
	Player.HammerState = 0;
	Player.Spinning = true;
}

if (lockTimer > 0) lockTimer--;

if (bounceState and Player.Grounded) bounceState = 0;



