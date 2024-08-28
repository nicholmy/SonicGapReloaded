/// @description Insert description here
// You can write your code in this editor

/*
if (sign(rotDir) > 0) angle = (angle + rotSpd) mod 360;
if (sign(rotDir) < 0) {
	// Negative numbers mod pretty weirdly
	angle -= rotSpd;
	if (rotSpd < 0) rotSpd += 360;
	angle = angle mod 360;
}
*/
// This has the angle swing beteween 180 and 0
pAngle++;
circleAngle = 90 * dcos(2*pAngle) + 90;

DistanceX = dcos(dcos(circleAngle) * -90 + 90) * 16;
DistanceY = dsin(dcos(circleAngle) * -90 + 90) * 16;

saw.x = floor(x + radius * dcos(circleAngle));
saw.y = floor(y + radius * dsin(circleAngle));