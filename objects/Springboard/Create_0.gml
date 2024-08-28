/// @description Set heightmap and etc.
// You can write your code in this editor
Heightmap = 
	[0, 1, 2, 3, 4, 4, 4, 5, 5, 5, 
	6, 6, 6, 7, 7, 7, 8, 8, 8, 9, 
	9, 9, 10, 10, 10, 11, 11, 11, 12, 12, 
	12, 13, 13, 13, 14, 14, 15, 15, 15, 16, 
	16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
	16, 16, 16, 16, 16, 16, 16, 16]
	
Heightmap2 = 
	[0, 1, 2, 3, 3, 3, 3, 3, 3, 4, 
	4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 
	6, 6, 6, 6, 6, 6, 6, 7, 7, 7, 
	7, 7, 7, 7, 7, 6, 6, 6, 6, 5,
	5, 5, 4, 4, 4, 4]
	
	LaunchForce = 10;
	timer = 0;
	// Set object properties
	object_set_unload(FlagPause);
	object_set_depth(Player, true);
	object_set_solidbox(28, 8, Heightmap);
	object_set_triggerbox(-22, 28, -32, 8);