/// @description Create steam hitbox
// You can write your code in this editor

instance_create(x, y-12, SteamVent_Up_Hitbox)

object_set_depth(Player, -1);
// Setup this object
object_set_solidbox(16, 8, false);

