/// @description Start/Stop the current
// You can write your code in this editor

if (!active and object_check_player(ColTrigger) and !Player.Death and !Player.DebugMode) {
	active = true;
	Player.Ysp = 0;
	
} else if (active and (Player.MoveState != StateCurrent or Player.Death or Player.DebugMode)) {
	active = false;
}

if (active) {
	Player.MoveState = StateCurrent;
	
	Player.Xsp = currentXSpd;
	Player.Facing = sign(currentXSpd);
	
	if (Input.Up) {
		Player.Ysp = -2;
	} else if (Input.Down) {
		Player.Ysp = 2;
	} else {
		Player.Ysp = 0;
	}
}

