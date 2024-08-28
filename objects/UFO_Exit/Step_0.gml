/// @description Insert description here
// TODO: Consider storing the layer id of the ufo as a variable for performance
if !State and object_check_player(ColTrigger) and layer_exists("UFO") {
	State = 1;
	
	with UFO {
		State = 4;
	}
}







