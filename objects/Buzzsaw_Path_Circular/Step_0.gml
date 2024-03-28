/// @description Insert description here
// You can write your code in this editor


if (sign(rotDir) > 0) angle = (angle + rotSpd) mod 360;
if (sign(rotDir) < 0) {
	// Negative numbers mod pretty weirdly
	angle -= rotSpd;
	if (rotSpd < 0) rotSpd += 360;
	angle = angle mod 360;
}

saw.x = floor(x + radius * dcos(angle));
saw.y = floor(y + radius * dsin(angle));