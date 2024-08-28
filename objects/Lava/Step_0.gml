/// @description Damage the player upon touching
// You can write your code in this editor
animation_play(sprite_index, 8, 0);
// Handle collision on all sides
object_act_solid(true, true, true, false);

if (object_check_player(ColSolidU)) {
	player_damage(true, false, false);
}