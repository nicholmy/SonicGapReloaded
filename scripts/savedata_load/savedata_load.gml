/// @function savedata_load(slot)
function savedata_load(slot)
{
	/* It is not recommended to modify saveslot file to save/load additional data.
	You'd want to create additional file in that case */
	
	// Get savedata file name
	var Filename = "saveslot" + string(slot + 1) + ".bin";
	
	if file_exists(Filename)
	{	
		var File = file_bin_open(Filename, 0);
		
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
		for (var i = 0; i <= 6; i++)
		{
			if i < 6
			{
				Data[i] = file_bin_read_byte(File);
			}
			
			// Read score
			else
			{
				Data[i] = 0;
				for (var  j = 0; j < 4; j++) 
				{
					Data[i] += file_bin_read_byte(File) * power(100, j);
				}
			}
		}
		for (var i = 7; i <= 8; i++) {
			Data[i] = file_bin_read_byte(File);
		}
		var zoneCount = array_length(global.SpecialRingList)
		// Making the assumption all zones have the same amt of rings
		//var spRingCount = array_length(global.SpecialRingList[0])
		//var redRingCount = array_length(global.RedRingList[0])
		
		Data[9] = array_create(zoneCount);
		for (var i = 0; i < zoneCount; i++) {
			var spRingCount = array_length(global.SpecialRingList[i]);
			Data[9][i] = array_create(spRingCount);
			
			for (var j = 0; j < spRingCount; j++) {
				Data[9][i][j] = file_bin_read_byte(File);
			}
		}
		
		Data[10] = array_create(zoneCount);
		for (var i = 0; i < zoneCount; i++) {
			var redRingCount = array_length(global.RedRingList[i])
			Data[10][i] = array_create(redRingCount);
			
			for (var j = 0; j < redRingCount; j++) {
				Data[10][i][j] = file_bin_read_byte(File);
			}
		}
		
		file_bin_close(File);
		
		return Data;
	}
	else
	{		
		return 0;
	}
}