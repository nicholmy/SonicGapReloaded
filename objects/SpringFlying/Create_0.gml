/// @description Insert description here
// You can write your code in this editor
startBounce = false;
superBounce = false;
bounceStrength = 2;
time = 0;

object_set_unload(FlagPause);
object_set_depth(Player, 0);
// Setup this object
object_set_solidbox(16, 12, false);