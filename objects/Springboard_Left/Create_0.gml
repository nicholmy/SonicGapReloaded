/// @description Insert description here
// You can write your code in this editor
Heightmap = 
	[16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 15, 15, 15, 14, 14, 13, 13, 13, 12, 12, 12, 11, 11, 11, 10, 10, 10, 9, 9, 9, 8, 8, 8, 7, 7, 7, 6, 6, 6, 5, 5, 5, 4, 4, 4, 3, 2, 1, 0]
		
Heightmap2 = 
	[4, 4, 4, 4, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 6, 6, 6, 6, 6, 6, 6, 6, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 3, 3, 3, 3, 3, 3, 2, 1, 0]
	
	LaunchForce = 10;
	timer = 0;
	// Set object properties
	object_set_unload(FlagPause);
	object_set_depth(Player, true);
	object_set_solidbox(28, 8, Heightmap);
	object_set_triggerbox(-28, 22, -32, 8);