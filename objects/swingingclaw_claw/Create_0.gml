/// @description Init Variables
baseX = x;
baseY = y - 32;
chainLength = 32;
rotAngle = 270;
rotSpeed = 0;
playerSpeed = 2;
rotSpdMax = 5;
swingMode = 0;
XSpeed = 0;
YSpeed = 0;
isGrabbing = false;
lockTimer = 0;
playerOffsetX = 0;
playerOffsetY = 24;
grabTime = 0;

object_set_unload(FlagReset);
object_set_triggerbox(-24, 24, -5, 25);

