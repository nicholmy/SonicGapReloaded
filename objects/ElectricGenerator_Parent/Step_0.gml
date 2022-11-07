/// @description Restart the clock
// You can write your code in this editor
animation_play(sprite_index, 8, 0);

object_act_solid(true, true, true, false);

// Upon player collision...
if (object_check_player(ColSolidU)) {
	player_damage(false, true, false);
}

if (alarm[0] == 0) {
	alarm[0] = random_range(1,60);
}


