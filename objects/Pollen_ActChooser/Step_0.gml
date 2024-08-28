/// @description Insert description here
// You can write your code in this editor

if(whiteSwitch) {
	with PollenMaker_Color {
		instance_destroy();
	}
	instance_create(x, y, PollenMaker_White);
	
	whiteSwitch = false;
}

if(colorSwitch) {
	with PollenMaker_White {
		instance_destroy();
	}
	instance_create(x, y, PollenMaker_Color);
	
	colorSwitch = false;
}