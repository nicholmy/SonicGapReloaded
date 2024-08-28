/// @description Insert description here
// You can write your code in this editor

// Rest state 0 = Idle
// 1 = Moving forwards thru path
// 2 = Not Grabbing, Counting down rest timer
// 3 = Moving backwards thru path

if (restState != 1 and endObj.isGrabbing) {
	//path_start(PathUp, moveSpd, path_action_stop, 0);
	path_speed = moveSpd;
	restState = 1;
	restTimer = 0;
}
if (restState == 1 and !endObj.isGrabbing) {
	//path_start(PathUp, 0, path_action_stop, 0);
	path_speed = 0;
	restState = 2;
	restTimer = restDelay;
}

if (restState == 2) {
	restTimer--;
}

if (restState == 2 and restTimer <= 0) {
	restState = 3;
}

if (restState == 3) {
	path_speed = -moveSpd;
	
}

// Inherit the parent event
event_inherited();

