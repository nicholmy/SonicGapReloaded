/// @description Insert description here
// You can write your code in this editor

// Enter the water
if (object_check_player(ColTrigger) and !Player.Grounded and waterSurfaceY < Player.PosY and !Player.IsUnderwater) {
	with Player {
		player_enter_water();
		
	}
	instance_create(Player.PosX, waterSurfaceY, WaterSplash);
}

// Exit the water
if (object_check_player(ColTrigger) and !Player.Grounded and waterSurfaceY >= Player.PosY and Player.IsUnderwater) {
	with Player {
		player_exit_water();
	}
	instance_create(Player.PosX, waterSurfaceY, WaterSplash);
}

// If you run too slow on top of the water you fall in
if (object_check_player(ColSolidU) and Player.Grounded and (Player.Gsp > -spdThreshold and Player.Gsp < spdThreshold)) {
	Player.OnObject = false;
	Player.Grounded = false;
	
	// Clear solidbox
	object_set_solidbox(0, 0, false);
}


// Players can run on top like its solid
if ((Player.Gsp <= -spdThreshold or Player.Gsp >= spdThreshold) and Player.Grounded) {
	// Clear solidbox
	object_set_solidbox(xRadius, yRadius, false);
	object_act_solid(false, true, false, false);
}
