/// @description Spin around
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (state == 1) {
	spinTimer--;

	if (spinTimer == 0) {
		image_angle += 45 * spinDirection;
	
		spinTimer = spinFreq;
	}
}


