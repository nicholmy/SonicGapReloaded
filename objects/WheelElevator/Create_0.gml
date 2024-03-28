/// @description Set Initial State
// States:
// 0 - Idle
// 1 - Moving (Spindash)
// Moves at a minimum speed as long as spindash is revving (down is being held?)
// Moves at a set faster speed when jump is pressed
// Slows to the minimum speed otherwise
// 2 - Slowing Down (Rolling)
// Exit upon jumping or while rolling the speed hits 0?
// -1 - Falling
state = 0;

Xsp = 0;
Ysp = 0;
facing = 1;
fallGrv = 0.21875;


object_set_solidbox(32, 6, false);
object_set_depth(Player, true);

isShaking = false;
allowFall = false;
shakeLength = 250;

