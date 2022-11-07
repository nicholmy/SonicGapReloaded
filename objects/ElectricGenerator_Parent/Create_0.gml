/// @description Start the clock for making electricity
if (makeElecFlag) {
	alarm[0] = 60;
}
object_set_unload(FlagReset);
object_set_solidbox(sprite_width/2, sprite_height/2, false);