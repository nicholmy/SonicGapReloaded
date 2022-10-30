/// @description Setup
// You can write your code in this editor

	State = 0;

	// Set object properties
	object_set_unload(FlagPause);
	object_set_depth(Player, 0);
	object_set_hitbox(16, 16);
	
	if (global.RedRingList[zoneID][ringID]) {
		instance_destroy();
	}
