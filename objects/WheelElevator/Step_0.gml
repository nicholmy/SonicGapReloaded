/// @description Start spinning on spindash

if (floor(Xsp) != 0) {
	animation_play(sprite_index, 6 - Xsp, 0);
}

if (state == 0 and object_check_player(ColSolidU)) {
	
	if (Player.Animation == AnimSpindash) {
		facing = Player.Facing;
		state = 1;
	}
	
	
	if (!isShaking and allowFall) {
		isShaking = true;
		// Start shake timer
		alarm[0] = shakeLength;
	}
}

if (state == 3 and object_check_player(ColSolidU)) {
	state = 0;
}

// Lock the player onto the device
if (state == 1 or state == 2) {
	Player.PosX = x;
	Player.Gsp = 3;
}

if (state == 1 and !Input.Down) {
	state = 2;
}

if (state == 2 and Input.ABCPress) {
	state = 0;
	Player.Xsp = 0;
}

if (state == -1) {
	Ysp += fallGrv;
}

x += Xsp;
y += Ysp;

if (state != -1) {
	object_act_solid(false, true, false, false);
}


