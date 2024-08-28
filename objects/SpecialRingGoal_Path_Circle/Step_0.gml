/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!Stage.IsFinished and !Player.Death) {
	x = floor(centerX + radius*dcos(angle));
	y = floor(centerY - radius*dsin(angle));

	angle += angularSpd
	
	if (angle >= 360) angle -= 360;
	else if (angle < 0) angle += 360;
}