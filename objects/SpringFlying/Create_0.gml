/// @description Setup variables and properties
// You can write your code in this editor
startBounce = false;
time = 0;
angle = 0;

object_set_unload(FlagPause);
object_set_depth(Player, 0);
// Setup this object
object_set_solidbox(32, 12, false);
object_set_hitbox(32, 12);