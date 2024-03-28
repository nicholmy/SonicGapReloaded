/// @description Insert description here
// You can write your code in this editor
x = x + 16

if (object_check_player(ColHitbox)) {
	player_damage(false, false, false);
}

if (x > room_width) {
	instance_destroy();
}