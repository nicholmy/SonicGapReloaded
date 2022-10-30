/// @function savedata_save(slot)
// I completely borked this function, need to rewrite it, use the older version
function savedata_save(slot)
{
	/* It is not recommended to modify saveslot file to save/load additional data.
	You'd want to create additional file in that case */
	
	// Get savedata file name
	var Filename = "saveslot" + string(slot + 1) + ".bin";
	
	if file_exists(Filename)
	{	
		var File = file_bin_open(Filename, 0);
		
		/* The function saves data in the following order:
		- Character
		- Zone ID
		- Emeralds
		- Lives
		- Continues
		- SaveState (game clear flag)
		- Score (split into 4 values) */
		
		ini_write_real("game", "clear", global.SaveState);
		ini_write_real("player", "character", global.Character);
		ini_write_real("player", "currentZone", global.ZoneID);
		ini_write_real("player", "special", global.SpecialRings);
		ini_write_real("player", "red", global.RedRings);
		
		for (var i = 0; i < array_length(global.SpecialRingList); i++) {
			var writeString = "";
			for (var j = 0; j < array_length(global.SpecialRingList[i]); j++) {
				writeString += string(global.SpecialRingList[i][j])
			}
			ini_write_string("special", string(i), writeString);
		}
		
		for (var i = 0; i < array_length(global.RedRingList); i++) {
			var writeString = "";
			for (var j = 0; j < array_length(global.RedRingList[i]); j++) {
				writeString += string(global.RedRingList[i][j])
			}
			ini_write_string("red", string(i), writeString);
		}
		
	ini_close();
	
	// Update slot
	global.SaveData[slot] = savedata_load_ini(slot);
	}
}