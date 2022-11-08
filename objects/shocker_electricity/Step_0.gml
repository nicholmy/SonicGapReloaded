/// @description Insert description here
// You can write your code in this editor
animation_play(sprite_index, 1, 0);

if object_check_player(ColHitbox)
{
	player_damage(false, true, false);
}