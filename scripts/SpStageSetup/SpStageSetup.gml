/// @ Called in Stage Controller -> Create Event
function SpStageSetup()
{
	/* Please note, that SaveProgress should be set to true only if the current stage
	is the last Act of the current Zone AND should save the progress once it is beaten
	
	IsFinalStage should only be used for the stage beating which  
	should mark the game in current saveslot as completed */
	
	switch room 
	{	
		case SpStage_Test:
		{
			ZoneName         = "SPECIAL____STAGE";
			ActID            = 0;
			WaterLevel       = 1440;
			WaterEnabled     = false;
			StageMusic       = SpecialTheme;
			AnimatedGraphics = [tex_tsz_anitile, 6];
			AnimalSet        = [spr_obj_animal_flicky, spr_obj_animal_ricky];
			BottomBoundary   = room_height;
			
			MaxTime			 = 3600;
			SpecialStageType = 0;
			
			NextStage	 = Screen_DevMenu;
			SaveProgress = false;
			IsFinalStage = false;	
		}
		break;
		case SpStage_Test_Rings:
		{
			ZoneName         = "SPECIAL____STAGE";
			ActID            = 0;
			WaterLevel       = 1440;
			WaterEnabled     = false;
			StageMusic       = SpecialTheme;
			AnimatedGraphics = [tex_tsz_anitile, 6];
			AnimalSet        = [spr_obj_animal_flicky, spr_obj_animal_ricky];
			BottomBoundary   = room_height;
			
			MaxTime			 = 3600;
			SpecialStageType = 3;
			RingsLeft		 = 15;
			
			NextStage	 = Screen_DevMenu;
			SaveProgress = false;
			IsFinalStage = false;	
		}
		break;
		case SpStage_Test_Enemies:
		{
			ZoneName         = "SPECIAL____STAGE";
			ActID            = 0;
			WaterLevel       = 1440;
			WaterEnabled     = false;
			StageMusic       = SpecialTheme;
			AnimatedGraphics = [tex_tsz_anitile, 6];
			AnimalSet        = [spr_obj_animal_flicky, spr_obj_animal_ricky];
			BottomBoundary   = room_height;
			
			MaxTime			 = 3600;
			SpecialStageType = 2;
			
			NextStage	 = Screen_DevMenu;
			SaveProgress = false;
			IsFinalStage = false;	
		}
		break;
		case SpStage_SS_1:
		{
			ZoneName         = "SPECIAL____STAGE";
			ActID            = 0;
			WaterLevel       = 1440;
			WaterEnabled     = false;
			StageMusic       = SkyStation_Bonus;
			AnimatedGraphics = [tex_tsz_anitile, 6];
			AnimalSet        = [spr_obj_animal_flicky, spr_obj_animal_ricky];
			BottomBoundary   = room_height;
			
			MaxTime			 = 2700;
			SpecialStageType = 3;
			RingsLeft		 = 10;
			
			NextStage	 = Screen_DevMenu;
			SaveProgress = false;
			IsFinalStage = false;	
		}
		break;
		case SpStage_SS_2:
		{
			ZoneName         = "SPECIAL____STAGE";
			ActID            = 0;
			WaterLevel       = 1440;
			WaterEnabled     = false;
			StageMusic       = SkyStation_Bonus;
			AnimatedGraphics = [tex_tsz_anitile, 6];
			AnimalSet        = [spr_obj_animal_flicky, spr_obj_animal_ricky];
			BottomBoundary   = room_height;
			
			MaxTime			 = 1400;
			SpecialStageType = 2;
			
			NextStage	 = Screen_DevMenu;
			SaveProgress = false;
			IsFinalStage = false;	
		}
		break;
		case SpStage_SS_3:
		{
			ZoneName         = "SPECIAL____STAGE";
			ActID            = 0;
			WaterLevel       = 1440;
			WaterEnabled     = false;
			StageMusic       = SkyStation_Bonus;
			AnimatedGraphics = [tex_tsz_anitile, 6];
			AnimalSet        = [spr_obj_animal_flicky, spr_obj_animal_ricky];
			BottomBoundary   = room_height;
			
			MaxTime			 = 1800;
			SpecialStageType = 1;
			
			NextStage	 = Screen_DevMenu;
			SaveProgress = false;
			IsFinalStage = false;	
		}
		break;
		case SpStage_SS_4:
		{
			ZoneName         = "SPECIAL____STAGE";
			ActID            = 0;
			WaterLevel       = 1440;
			WaterEnabled     = false;
			StageMusic       = SkyStation_Bonus;
			AnimatedGraphics = [tex_tsz_anitile, 6];
			AnimalSet        = [spr_obj_animal_flicky, spr_obj_animal_ricky];
			BottomBoundary   = room_height;
			
			MaxTime			 = 3600;
			SpecialStageType = 3;
			RingsLeft		 = 15;
			
			NextStage	 = Screen_DevMenu;
			SaveProgress = false;
			IsFinalStage = false;	
		}
		break;
		case SpStage_SS_5:
		{
			ZoneName         = "SPECIAL____STAGE";
			ActID            = 0;
			WaterLevel       = 1440;
			WaterEnabled     = false;
			StageMusic       = SkyStation_Bonus;
			AnimatedGraphics = [tex_tsz_anitile, 6];
			AnimalSet        = [spr_obj_animal_flicky, spr_obj_animal_ricky];
			BottomBoundary   = room_height;
			
			MaxTime			 = 1600;
			SpecialStageType = 0;
			
			NextStage	 = Screen_DevMenu;
			SaveProgress = false;
			IsFinalStage = false;	
		}
		break;
		// Template
		default:
		{
			ZoneName	     = "TEMPLATE";
			ActID		     = 0;
			GapLevel		 = false;
			WaterLevel	     = 0;
			WaterEnabled     = false;
			StageMusic       = SpecialTheme;
			AnimatedGraphics = noone;		// Array: [sprite1, sprite1 duration, sprite2, sprite2 duration...]	
			AnimalSet	     = noone;		// Array: [animalsprite1, animalsprite2...]
			BottomBoundary	 = room_height;
			
			SpecialStageType = 0; // 0 = Get to the End, 1 = Get all rings, 2 = Defeat all enemies, 3 = Get all rings (random)
			MaxTime			 = 3600;
			RingsLeft        = 0;
			EnemiesLeft      = 0;
			
			NextStage	 = Screen_DevMenu;
			SaveProgress = false;
			IsFinalStage = false;				
		}
	}
}