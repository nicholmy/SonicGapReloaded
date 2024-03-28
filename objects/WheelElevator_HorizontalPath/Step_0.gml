/// @description Move the wheel

if (wheel.state == 0) {
	wheel.Xsp = 0;
}

if (wheel.state == 1 or wheel.state == 2) {
	alarm[0] = 60;
}

if (wheel.state == 1 and Input.ABCPress) {
	curMoveSpd = maxMoveSpd;
}

if (wheel.state == 1 or wheel.state == 2) {
	curMoveSpd -= frict;
	curMoveSpd = max(minMoveSpd, curMoveSpd);
	
	wheel.Xsp = floor(Player.Facing * curMoveSpd);
} 

if (wheel.state == 3) {
	wheel.Xsp = -minMoveSpd;
}


/*if (rewindable and wheel.state == 0 and wheel.x != x) {
	alarm[0] = 60;
}
*/



