/// @description Setup
// You can write your code in this editor
// So it can be placed in other layers
object_set_solidbox(0, 0, false);
object_set_hitbox(0, 0);
object_set_triggerbox(0, 0, 0, 0);
object_set_unload(FlagPause);
	// Set object properties
	
if (instance_exists(UFO))  object_set_depth(UFO, 1);
	animation_play(sprite_index, [6, 8, 8, 8, 8, 0], 5);