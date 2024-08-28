// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function savedata_nosave(){
	/* The function reads data in the following order:
		- Character
		- Stage
		- Emeralds
		- Lives
		- Continues
		- SaveState (game clear flag)
		- Score (split into 4 values)
		- Special Ring Count
		- Red Ring Count
		- Special Ring List
		- Red Ring List
		*/
		
	// Read data
		var Data;
		
		Data[0] = false;
		Data[1] = 0;
		Data[2] = 0;
		Data[3] = 0;
		Data[4] = 0;
		
		var zoneCount = array_length(global.SpecialRingList)
		
		Data[9] = array_create(zoneCount);
		for (var i = 0; i < zoneCount; i++) {
			var spRingCount = array_length(global.SpecialRingList[i]);
			Data[9][i] = array_create(spRingCount);
			
			var zoneString = string_repeat("0",spRingCount);
			for (var j = 0; j < spRingCount; j++) {
				if (string_char_at(zoneString, j+1) != "") {
					// string_char_at counts 0 and 1 as the first index...
					Data[9][i][j] = int64(string_char_at(zoneString, j+1));
				}
				else {
					Data[9][i][j] = 0;
				}
			}
		}
		
		Data[10] = array_create(zoneCount);
		for (var i = 0; i < zoneCount; i++) {
			var redRingCount = array_length(global.RedRingList[i])
			Data[10][i] = array_create(redRingCount);
			
			var zoneString = string_repeat("0",redRingCount);
			for (var j = 0; j < redRingCount; j++) {
				if (string_char_at(zoneString, j+1) != "") {
					Data[10][i][j] = int64(string_char_at(zoneString, j+1));
				}
				else {
					Data[10][i][j] = 0;
				}
			}
		}
		
		return Data;
}