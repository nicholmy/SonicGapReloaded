// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function savedata_reset(){
	global.LastZoneCleared = 0;
	global.LastScoreTarget = 0;
	
	global.Lives	 = 3;
	global.Continues = 0;
	global.Emeralds  = 0;
	global.Score	 = 0;
	global.ZoneID    = 0;
	global.SaveState = 0;
	global.SpecialRings = 0;
	global.RedRings = 0;
	
	// This needs to be updated every time a new special or red ring is added
	// Each row stands for a zone
	// 0 = Not Unlocked
	// 1 = Unlocked
	// 2 = Cleared
	global.SpecialRingList = [
		[0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0]
	];
	global.SpecialRingList2 = [
		0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0
	];
	global.RedRingList = [
		[0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0]
	];
	global.RedRingList2 = [
		0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0
	];
}