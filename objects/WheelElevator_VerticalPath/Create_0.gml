/// @description Set up the wheel and movement vars
// You can write your code in this editor
distance = 256;

minMoveSpd = 1;
maxMoveSpd = 4;
frict = 4.0 / 60.0;
curMoveSpd = 0;

wheel = instance_create(x, y, WheelElevator);

// Platform Types
// 0 - Stays still after jumping off
// 1 - Rewinds back after jumping off
rewindable = true;

