// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MapSetup(){
	global.Score = 0;
	global.Rings = 0;
	global.LastZoneCleared = 0;
	global.LastCourseID = 0;
	global.LastTimeCleared = 0;
	global.LastScoreTarget = 0;
	global.SONICBonus = false;
	switch room 
	{
		// Sky Station's Map
		case Map_SkyStation:
		{
			StageType        = 0;
			ZoneName         = "SKY STATION";
			ZoneID			 = 0;
			ActID            = 0;
			GapLevel		 = false;
			WaterLevel       = 1440;
			WaterEnabled     = false;
			StageMusic       = Tutorial1;
			StageMusic2      = Tutorial2;
			AnimatedGraphics = [tex_tsz_anitile, 6];
			AnimalSet        = [spr_obj_animal_flicky, spr_obj_animal_ricky];
			BottomBoundary   = room_height;
			
			var count = 0;
			var redFlagList = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
			for (var i = 0; i < array_length(redFlagList); i++) {
				if (global.RedRingList2[i]) {
					count += 1;
				} 
			}
	
			if count >= 10 {
				StageMusic = SkyStation_Menu3;
			}
			else if count >= 3 {
				StageMusic = SkyStation_Menu2;
			}
			else {
				StageMusic = SkyStation_Menu1;
			}
			
			NextStage	 = Screen_DevMenu;
			SaveProgress = false;
			IsFinalStage = false;	
		}
		break;
		// Sky Station's Map
		case Map_TechTree:
		{
			StageType        = 0;
			ZoneName         = "TECHNOLOGY TREE";
			ZoneID			 = 0;
			ActID            = 0;
			GapLevel		 = false;
			WaterLevel       = 1440;
			WaterEnabled     = false;
			StageMusic       = Tutorial1;
			StageMusic2      = Tutorial2;
			AnimatedGraphics = [tex_tsz_anitile, 6];
			AnimalSet        = [spr_obj_animal_flicky, spr_obj_animal_ricky];
			BottomBoundary   = room_height;
			
			var ttcount = 0;
			var ttredFlagList = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
			for (var i = 0; i < array_length(ttredFlagList); i++) {
				if (global.RedRingList2[i]) {
					ttcount += 1;
				} 
			}
	
			if ttcount >= 10 {
				StageMusic = TechTree_Menu3;
			}
			else if ttcount >= 3 {
				StageMusic = TechTree_Menu2;
			}
			else {
				StageMusic = TechTree_Menu1;
			}
			
			NextStage	 = Screen_DevMenu;
			SaveProgress = false;
			IsFinalStage = false;	
		}
		break;
	}
}