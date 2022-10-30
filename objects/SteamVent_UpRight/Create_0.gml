/// @description Create steam hitbox
// You can write your code in this editor

instance_create(x+8, y-12, SteamVent_UpRight_Hitbox)

object_set_depth(Player, false);
// Setup this object
object_set_solidbox(16, 8, false);

