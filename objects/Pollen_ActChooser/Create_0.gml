/// @description Insert description here
// You can write your code in this editor

whiteSwitch = false;
colorSwitch = false;

if (global.CurrentAct == 1) {
	instance_create(x, y, PollenMaker_Color);
} else {
	instance_create(x, y, PollenMaker_White);
}