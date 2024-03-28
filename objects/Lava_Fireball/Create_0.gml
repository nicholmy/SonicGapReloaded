/// @description Setup hitboxes and physics
// You can write your code in this editor

	PosX  = x;
	PosY  = y;
	Xsp   = 0;
	Ysp   = 0;
	Grv   = 0.21875;
	State = 0;

object_set_hitbox(8, 16);
object_set_depth(Player, false);