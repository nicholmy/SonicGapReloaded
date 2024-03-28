/// @description Insert description here
// You can write your code in this editor

if (state == 1 and Input.ABCPress) {
	prevSpeed = path_speed;
	path_speed = 0;
	alarm[1] = cooldownLength;
}

// Inherit the parent event
event_inherited();

