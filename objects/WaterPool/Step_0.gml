/// @description Insert description here
// You can write your code in this editor

if (!Player.IsUnderwater and object_check_player(ColTrigger) and !Player.Death) {
	with Player {
		player_enter_water();
	}
}

if (Player.IsUnderwater and !Player.Drown and !Player.Death) {
	var count = 0;
	with WaterPool {
		if (object_check_player(ColTrigger)) count++;
	}
	if (count == 0) {
		with Player {
			player_exit_water();
		}
	}
}