/// @description Damage the player upon collision
// You can write your code in this editor
if (active and object_check_player(ColHitbox)) {
	player_damage(false, true, false);
}

visible = active;


