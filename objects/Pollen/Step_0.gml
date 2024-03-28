/// @description Move in a wave
vspeed = -0.125 * dsin(rotAngle)
rotAngle = (rotAngle + 1) % 360

var screenX = Camera.ViewX;
var screenWidth = global.Width;

if ((x < screenX - 32) or (x > screenX + screenWidth + 4)) instance_destroy();