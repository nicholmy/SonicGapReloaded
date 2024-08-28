/// @ Called in DefaultMenu Controller -> Create Event
function VVMenuSetup()
{
	ZoneID = 2;
	global.CurrentAct = 0;
	audio_bgm_play(AudioPrimary, VivVovage_Menu)
	
	menu_add_header(0,    "SONIC GAP RELOADED" + "\n\nVIVID VOYAGE");
	menu_add_option(0, 0, "MAIN LEVELS",  2);
	menu_add_option(0, 1, "SPECIAL STAGES", 3);
	menu_add_option(0, 2, "SPECIAL STAGES 2", 5);
	menu_add_option(0, 3, "CHARACTER SELECT", 1);
	menu_add_option(0, 4, "ZONE SELECT", 4);	
	menu_add_option(0, 5, "BACK TO TITLE",    noone);
	
	// Character Select
	menu_add_header(1,    "SELECT A PLAYER");
	menu_add_option(1, 0, "SONIC",	  0);
	menu_add_option(1, 1, "TAILS",	  0);
	menu_add_option(1, 2, "KNUCKLES", 0);
	menu_add_option(1, 3, "MIGHTY", 0);
	menu_add_option(1, 4, "RAY", 0);
	menu_add_option(1, 5, "AMY", 0);
	
	// Stage Select
	menu_add_header(2,    "SELECT A STAGE");
	menu_add_option(2, 0, "3-1", Stage_TechTree1);
	menu_add_option(2, 1, "3-K", Stage_TechTreeAmy);
	//menu_add_option(2, 1, "2-2", Stage_TechTree1);
	//menu_add_option(2, 2, "2-3", Stage_TechTreeBoss);

	
	menu_add_header(3,    "SELECT A SPECIAL STAGE");
	menu_add_option(3, 0, "STAGE 1", SpStage_TT_1);
	menu_add_option(3, 1, "STAGE 2", SpStage_TT_2);
	menu_add_option(3, 2, "STAGE 3", SpStage_TT_3);
	menu_add_option(3, 3, "STAGE 4", SpStage_TT_4);
	menu_add_option(3, 4, "STAGE 5", SpStage_TT_5);
	
	// Zone Select
	menu_add_header(4,    "SELECT A ZONE");
	menu_add_option(4, 0, "SKY STATION", Screen_SkyStation);
	menu_add_option(4, 0, "TECHNOLOGY TREE", Screen_TechTree);
	
	
	menu_add_header(5,    "SELECT A SPECIAL STAGE");
	menu_add_option(5, 0, "STAGE 6", SpStage_TT_6);
	
	// Options
	menu_add_header(6,    "OPTIONS");
	menu_add_option(6, 0, "FULLSCREEN: ",   noone);
	menu_add_option(6, 1, "WINDOW SIZE: ",  noone);
	menu_add_option(6, 2, "SOUND VOLUME: ", noone);
	menu_add_option(6, 3, "MUSIC VOLUME: ", noone);
}