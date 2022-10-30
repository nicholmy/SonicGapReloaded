/// @function savedata_load_ini(slot)
function savedata_load_ini(slot)
{
	/* It is not recommended to modify saveslot file to save/load additional data.
	You'd want to create additional file in that case */
	
	// Get savedata file name
	var Filename = "saveslot" + string(slot + 1) + ".ini";
	
	if file_exists(Filename)
	{	
		ini_open(Filename);
		
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
		
		Data[0] = ini_read_real("game", "clear", false);
		Data[1] = ini_read_real("player", "character", 0);
		Data[2] = ini_read_real("player", "currentZone", 0);
		Data[3] = ini_read_real("player", "special", 0);
		Data[4] = ini_read_real("player", "red", 0);
		
		var zoneCount = array_length(global.SpecialRingList)
		
		Data[9] = array_create(zoneCount);
		for (var i = 0; i < zoneCount; i++) {
			var spRingCount = array_length(global.SpecialRingList[i]);
			Data[9][i] = array_create(spRingCount);
			
			var zoneString = ini_read_string("special", string(i), string_repeat("0",spRingCount));
			for (var j = 0; j < spRingCount; j++) {
				Data[9][i][j] = string_char_at(zoneString, j) == "1";
			}
		}
		
		Data[10] = array_create(zoneCount);
		for (var i = 0; i < zoneCount; i++) {
			var redRingCount = array_length(global.RedRingList[i])
			Data[10][i] = array_create(redRingCount);
			
			var zoneString = ini_read_string("red", string(i), string_repeat("0",redRingCount));
			for (var j = 0; j < redRingCount; j++) {
				Data[10][i][j] = string_char_at(zoneString, j) == "1";
			}
		}
		
		ini_close();
		
		return Data;
	}
	else
	{		
		return 0;
	}
}