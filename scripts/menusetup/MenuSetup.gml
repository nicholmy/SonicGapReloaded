/// @ Called in DefaultMenu Controller -> Create Event
function MenuSetup()
{
	/* The game will use global.ZoneID of the selected saveslot as an index for this array,
	and therefore it should contain the first acts of your zones in their gameplay order
	
	Use 'noone' to fill the blanks slots for the zones that do not exist yet */
	ZoneOrder =
	[
		Map_SkyStation,
		Screen_TechTree,
		noone,
		noone
	];
	StartStage = Map_SkyStation;
	global.CurrentAct = 0;
	global.ReturnRoom = room;
	
	// Main Menu
	menu_add_header(0,    "SONIC GAP RELOADED\n\nDEMO V1-1" + "\n\nMAIN MENU");
	menu_add_option(0, 0, "GAME START",   1);
	menu_add_option(0, 1, "- -", 3);
	menu_add_option(0, 2, "OPTIONS",      6);	
	menu_add_option(0, 3, "EXIT GAME",    noone);
	
	// Game Start
	menu_add_header(1,    "SELECT A SAVE FILE");
	menu_add_option(1, 0, "NO SAVE MODE",		  3);
	menu_add_option(1, 1, string(DisplayData[0]), 3);
	menu_add_option(1, 2, string(DisplayData[1]), 3);
	menu_add_option(1, 3, string(DisplayData[2]), 3);
	menu_add_option(1, 4, string(DisplayData[3]), 3);
	menu_add_option(1, 5, "DELETE SAVE",		  7);
	
	// Scene Select
	menu_add_header(2,    "SELECT A SCENE TYPE");
	menu_add_option(2, 0, "STAGE",  4);
	menu_add_option(2, 1, "SCREEN", 5);
	menu_add_option(2, 2, "SPECIAL", 8);
	
	// Character Select
	menu_add_header(3,    "SELECT A PLAYER");
	menu_add_option(3, 0, "SONIC",	  2);
	menu_add_option(3, 1, "TAILS",	  2);
	menu_add_option(3, 2, "KNUCKLES", 2);
	menu_add_option(3, 3, "MIGHTY", 2);
	menu_add_option(3, 4, "RAY", 2);
	menu_add_option(3, 5, "AMY", 2);
		
	// Stage Select
	menu_add_header(4,    "SELECT A STAGE");
	menu_add_option(4, 0, "TECH TREE AMY", Stage_TechTreeAmy);
	menu_add_option(4, 1, "VIVID VOVAGE SPECIAL",  SpStage_VV_1);
	menu_add_option(4, 2, "SS - SS6", SpStage_SS_6);
	menu_add_option(4, 3, "SONIC TUTORIAL", Stage_Tutorial);
	menu_add_option(4, 4, "- -", noone);
	
	// Screen select
	menu_add_header(5,    "SELECT A SCREEN");
	menu_add_option(5, 0, "SPLASH",		   Screen_Splash);
	menu_add_option(5, 1, "CONTINUE",	   Screen_Continue);
	menu_add_option(5, 2, "SPECIAL START", Screen_SStage);
	menu_add_option(5, 3, "SKY STATION",		   Screen_SkyStation);
	menu_add_option(5, 4, "TECH TREE",		  Screen_TechTree);
	
	// Options
	menu_add_header(6,    "OPTIONS");
	menu_add_option(6, 0, "FULLSCREEN: ",   noone);
	menu_add_option(6, 1, "WINDOW SIZE: ",  noone);
	menu_add_option(6, 2, "SOUND VOLUME: ", noone);
	menu_add_option(6, 3, "MUSIC VOLUME: ", noone);
	menu_add_option(6, 4, "SET CONTROLS", noone);
	
	// Game Start (delete data)
	menu_add_header(7,    "SELECT A SAVE FILE TO DELETE");
	menu_add_option(7, 0, "SLOT 1", noone);
	menu_add_option(7, 1, "SLOT 2", noone);
	menu_add_option(7, 2, "SLOT 3", noone);
	menu_add_option(7, 3, "SLOT 4", noone);
	
	menu_add_header(8,    "SELECT A SPECIAL STAGE");
	menu_add_option(8, 0, "TT - TT4", SpStage_TT_4);
	menu_add_option(8, 1, "TT - TT7", SpStage_TT_7);
	menu_add_option(8, 2, "TT - TT8", SpStage_TT_8);
	menu_add_option(8, 3, "TT - TT9", SpStage_TT_9);
	menu_add_option(8, 4, "TT - TT10", SpStage_TT_10);
}