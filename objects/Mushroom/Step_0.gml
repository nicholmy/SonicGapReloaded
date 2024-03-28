/// @description Insert description here
// You can write your code in this editor

if (!state and !lockTimer and !Player.Hurt and !Player.Death and object_check_player(ColHitbox) and Player.Ysp > 0) {
	state = 1;
	object_set_depth(Player, true);
	Player.PosX = x;
	Player.PosY = y-2;
	Player.BarrierIsActive = false;

	alarm[0] = 15;
}

if (state) {
	Player.AirLock = true;
	Player.PosX = x;
	Player.PosY = y-2;
	Player.Xsp = 0;
	Player.Ysp = 0;
	
	player_reset_air();
}

if (lockTimer > 0) lockTimer--;

if (bounceState and Player.Grounded) bounceState = 0;



