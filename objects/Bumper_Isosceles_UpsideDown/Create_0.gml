/// @description Set heightmap and other properties
Heightmap = 
	[
	10, 10, 10, 10, 10, 10, 10, 10
	]
	/*[
	29, 29, 29, 29, 28, 28, 28, 28, 27, 27, 27, 
	27, 26, 26, 26, 26, 25, 25, 25, 25, 24, 24,
	24, 24, 23, 23, 23, 23, 22, 22, 22, 22, 21, 
	21, 21, 21, 20, 20, 20, 20, 19, 19, 19, 19, 
	18, 18, 18, 17, 17, 17, 17, 16, 16, 16, 16,
	15, 15, 15, 14, 13, 12,
	12, 13, 14, 15, 15, 15, 16, 16, 16, 16,
	17, 17, 17, 17, 18, 18, 18, 19, 19, 19, 19,
	20, 20, 20, 20, 21, 21, 21, 21, 22, 22, 22,
	22, 23, 23, 23, 23, 24, 24, 24, 24, 25, 25,
	25, 25, 26, 26, 26, 26, 27, 27, 27, 27, 28,
	28, 28, 28, 29, 29, 29, 29
	]*/
	
	LaunchForce = 10;
	timer = 0;
	// Set object properties
	object_set_unload(FlagPause);
	object_set_depth(Player, true);
	object_set_solidbox(61, 16, Heightmap)
	//object_set_triggerbox(-22, 28, -32, 8);