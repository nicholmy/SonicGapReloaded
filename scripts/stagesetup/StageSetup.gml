/// @ Called in Stage Controller -> Create Event
function StageSetup()
{
	/* Please note, that SaveProgress should be set to true only if the current stage
	is the last Act of the current Zone AND should save the progress once it is beaten
	
	IsFinalStage should only be used for the stage beating which  
	should mark the game in current saveslot as completed */
	
	switch room 
	{	
		// Twilight Station (Test Stage)
		case Stage_TSZ:
		{
			ZoneName         = "TWILIGHT____STATION";
			ActID            = 0;
			GapLevel		 = false;
			WaterLevel       = 1440;
			WaterEnabled     = true;
			StageMusic       = TestStage;
			AnimatedGraphics = [tex_tsz_anitile, 6];
			AnimalSet        = [spr_obj_animal_flicky, spr_obj_animal_ricky];
			BottomBoundary   = 1040;
			
			NextStage	 = Screen_DevMenu;
			SaveProgress = false;
			IsFinalStage = false;	
		}
		break;
		
		// Twilight Station (Test Stage)
		case Stage_TSZ2:
		{
			ZoneName         = "TEST____STATION";
			ActID            = 0;
			GapLevel		 = false;
			WaterLevel       = 0;
			WaterEnabled     = false;
			StageMusic       = TechTree_Menu1;
			AnimatedGraphics = [tex_tsz_anitile, 6];
			AnimalSet        = [spr_obj_animal_flicky, spr_obj_animal_ricky];
			BottomBoundary   = room_height;
			
			NextStage	 = Screen_DevMenu;
			SaveProgress = false;
			IsFinalStage = false;	
		}
		break;
		
		// Twilight Station (Test Stage)
		case Stage_TestGap:
		{
			ZoneName         = "GAP____STATION";
			ActID            = 0;
			GapLevel		 = true;
			WaterLevel       = 0;
			WaterEnabled     = false;
			StageMusic       = SkyStation_Special1;
			AnimatedGraphics = [tex_tsz_anitile, 6];
			AnimalSet        = [spr_obj_animal_flicky, spr_obj_animal_ricky];
			BottomBoundary   = room_height;
			
			NextStage	 = Screen_DevMenu;
			SaveProgress = false;
			IsFinalStage = false;
			
			GapNameList = [
			"HELLO WORLD RAMP", 
			"HELLO WORLD TRANSFER",
			"HELLO WORLD SLINGSHOT",
			"HELLO WORLD HOP",
			"HELLO WORLD NO JUMP",
			"HELLO WORLD NO TURN"]
			
			GapScoreList = [
			200,
			200,
			200,
			200,
			200,
			200
			]
		}
		break;
		
		
		// Tutorial Level
		case Stage_Tutorial:
		{
			StageType        = 1;
			ZoneName         = "TUTORIAL";
			ActID            = 0;
			GapLevel		 = false;
			WaterLevel       = 1440;
			WaterEnabled     = false;
			StageMusic       = Tutorial1;
			StageMusic2      = Tutorial2;
			AnimatedGraphics = [tex_tsz_anitile, 6];
			AnimalSet        = [spr_obj_animal_flicky, spr_obj_animal_ricky];
			BottomBoundary   = room_height;
			
			NextStage	 = Screen_DevMenu;
			SaveProgress = false;
			IsFinalStage = false;	
		}
		break;
		// Star Station
		case Stage_StarStation:
		{
			ZoneName         = "SKY____STATION";
			ActID            = 0;
			GapLevel		 = true;
			WaterLevel       = 0;
			WaterEnabled     = false;
			StageMusic       = SkyStation_Gap1;
			AnimatedGraphics = [tex_tsz_anitile, 6];
			AnimalSet        = [spr_obj_animal_flicky, spr_obj_animal_ricky];
			BottomBoundary   = room_height;
			ScoreTarget		 = 3000;
			
			NextStage	 = Screen_SkyStation;
			SaveProgress = false;
			IsFinalStage = false;
			
			GapNameList = [
			"HELLO WORLD SLINGSHOT", 
			"HELLO WORLD RAMP",
			"HELLO WORLD TRANSFER"]
			
			GapScoreList = [
			200,
			200,
			200
			]
		}
		break;
		case Stage_StarStation2:
		{
			ZoneName         = "SKY____STATION";
			ActID            = 1;
			GapLevel		 = true;
			WaterLevel       = 0;
			WaterEnabled     = false;
			StageMusic       = SkyStation_Gap2;
			AnimatedGraphics = [tex_tsz_anitile, 6];
			AnimalSet        = [spr_obj_animal_flicky, spr_obj_animal_ricky];
			BottomBoundary   = room_height;
			ScoreTarget		 = 5000;
			
			NextStage	 = Screen_SkyStation;
			SaveProgress = false;
			IsFinalStage = false;
			
			GapNameList = [
			"CANYON JUMP", 
			"HELLO WORLD BAT JUMP",
			"PEAK TRANSFER",
			"TALL SLINGSHOT",
			"AROUND THE WORLD SLINGSHOT",
			"THROUGH THE RAMP",
			"LEAP TO THE MIDDLE"]
			
			GapScoreList = [
			200,
			200,
			200,
			200,
			200,
			500,
			1000
			]
		}
		break;
		case Stage_TechTree1:
		{
			ZoneName         = "TECHNOLOGY____TREE";
			ActID            = 0;
			GapLevel		 = true;
			WaterLevel       = 0;
			WaterEnabled     = false;
			StageMusic       = TechTree_Menu2;
			AnimatedGraphics = [tex_tsz_anitile, 6];
			AnimalSet        = [spr_obj_animal_flicky, spr_obj_animal_ricky];
			BottomBoundary   = room_height;
			ScoreTarget		 = 5000;
			
			NextStage	 = Screen_TechTree;
			SaveProgress = false;
			IsFinalStage = false;
			
			GapNameList = [
			"NO JUMPING 1", 
			"NO JUMPING 2",
			"PEAK TRANSFER",
			"A SHOCKING JUMP",
			"UP AND DOWN AND ALL AROUND",
			"THROUGH THE RAMP",
			"LEAP TO THE MIDDLE",
			"NO JUMPING 3"]
			
			GapScoreList = [
			200,
			200,
			200,
			200,
			500,
			500,
			1000
			]
		}
		break;
		// Amy's Tutorial Level
		case Stage_TechTreeAmy:
		{
			ZoneName         = "TECHNOLOGY____TREE";
			ActID            = 0;
			GapLevel		 = false;
			WaterLevel       = 1440;
			WaterEnabled     = false;
			StageMusic       = TechTree_Amy1;
			StageMusic2      = TechTree_Amy2;
			AnimatedGraphics = [tex_tsz_anitile, 6];
			AnimalSet        = [spr_obj_animal_flicky, spr_obj_animal_ricky];
			BottomBoundary   = room_height;
			
			NextStage	 = Screen_TechTree;
			SaveProgress = false;
			IsFinalStage = false;	
		}
		break;
		case Stage_TechTreeBoss:
		{
			ZoneName         = "TECHNOLOGY____TREE";
			ActID            = 2;
			GapLevel		 = true;
			WaterLevel       = 0;
			WaterEnabled     = false;
			StageMusic       = TechTree_Menu3;
			AnimatedGraphics = [tex_tsz_anitile, 6];
			AnimalSet        = [spr_obj_animal_flicky, spr_obj_animal_ricky];
			BottomBoundary   = room_height;
			ScoreTarget		 = 5000;
			
			NextStage	 = Screen_TechTree;
			SaveProgress = false;
			IsFinalStage = false;
			
			GapNameList = [
			"CANYON JUMP", 
			"HELLO WORLD BAT JUMP",
			"PEAK TRANSFER",
			"TALL SLINGSHOT",
			"AROUND THE WORLD SLINGSHOT",
			"THROUGH THE RAMP",
			"LEAP TO THE MIDDLE"]
			
			GapScoreList = [
			200,
			200,
			200,
			200,
			200,
			500,
			1000
			]
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
			StageMusic       = noone;
			AnimatedGraphics = noone;		// Array: [sprite1, sprite1 duration, sprite2, sprite2 duration...]	
			AnimalSet	     = noone;		// Array: [animalsprite1, animalsprite2...]
			BottomBoundary	 = room_height;
			
			NextStage	 = Screen_DevMenu;
			SaveProgress = false;
			IsFinalStage = false;				
		}
	}
}