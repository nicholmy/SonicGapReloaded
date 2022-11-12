/// @ Called in DefaultMenu Controller -> Create Event
function MenuSetup()
{
	/* The game will use global.ZoneID of the selected saveslot as an index for this array,
	and therefore it should contain the first acts of your zones in their gameplay order
	
	Use 'noone' to fill the blanks slots for the zones that do not exist yet */
	ZoneOrder =
	[
		Screen_SkyStation,
		Screen_TechTree,
		noone,
		noone
	];
	StartStage = Screen_SkyStation;
	
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
		
	// Stage Select
	menu_add_header(4,    "SELECT A STAGE");
	menu_add_option(4, 0, "TEST STAGE",  Stage_TSZ);
	menu_add_option(4, 1, "STAR STATION 1", Stage_StarStation);
	menu_add_option(4, 2, "STAR STATION 2", Stage_StarStation2);
	menu_add_option(4, 3, "GAP STAGE", Stage_TestGap);
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
	
	// Game Start (delete data)
	menu_add_header(7,    "SELECT A SAVE FILE TO DELETE");
	menu_add_option(7, 0, "SLOT 1", noone);
	menu_add_option(7, 1, "SLOT 2", noone);
	menu_add_option(7, 2, "SLOT 3", noone);
	menu_add_option(7, 3, "SLOT 4", noone);
	
	menu_add_header(8,    "SELECT A SPECIAL STAGE");
	menu_add_option(8, 0, "STAR STATION 1", SpStage_SS_1);
	menu_add_option(8, 1, "STAR STATION 2", SpStage_SS_2);
	menu_add_option(8, 2, "STAR STATION 3", SpStage_SS_3);
	menu_add_option(8, 3, "STAR STATION 4", SpStage_SS_4);
	menu_add_option(8, 4, "STAR STATION 5", SpStage_SS_5);
}