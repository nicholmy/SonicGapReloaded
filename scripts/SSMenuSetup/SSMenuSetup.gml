/// @ Called in DefaultMenu Controller -> Create Event
function SSMenuSetup()
{
	ZoneID = 0;
	audio_bgm_play(AudioPrimary, SkyStation_Menu)
	
	menu_add_header(0,    "SONIC GAP RELOADED" + "\n\nSKY STATION");
	menu_add_option(0, 0, "GAP LEVELS",   2);
	menu_add_option(0, 1, "SPECIAL STAGES", 3);
	menu_add_option(0, 2, "CHARACTER SELECT", 1);
	menu_add_option(0, 3, "ZONE SELECT", 4);	
	menu_add_option(0, 4, "BACK TO TITLE",    noone);
	
	// Character Select
	menu_add_header(1,    "SELECT A CHARACTER");
	menu_add_option(1, 0, "SONIC",	  0);
	menu_add_option(1, 1, "TAILS",	  0);
	menu_add_option(1, 2, "KNUCKLES", 0);
	menu_add_option(1, 3, "MIGHTY", 0);
	
	// Stage Select
	menu_add_header(2,    "SELECT A STAGE");
	menu_add_option(2, 0, "SKY STATION 1",  Stage_StarStation);
	menu_add_option(2, 1, "SKY STATION 2", Stage_StarStation2);

	// Special Stage Select
	menu_add_header(3,    "SELECT A SPECIAL STAGE");
	menu_add_option(3, 0, "STAGE 1", SpStage_SS_1);
	menu_add_option(3, 1, "STAGE 2", SpStage_SS_2);
	menu_add_option(3, 2, "STAGE 3", SpStage_SS_3);
	menu_add_option(3, 3, "STAGE 4", SpStage_SS_4);
	menu_add_option(3, 4, "STAGE 5", SpStage_SS_5);
	
	// Zone Select
	menu_add_header(4,    "SELECT A ZONE");
	menu_add_option(4, 0, "TECHNOLOGY TREE", Screen_TechTree);
	
	
	// Options
	menu_add_header(6,    "OPTIONS");
	menu_add_option(6, 0, "FULLSCREEN: ",   noone);
	menu_add_option(6, 1, "WINDOW SIZE: ",  noone);
	menu_add_option(6, 2, "SOUND VOLUME: ", noone);
	menu_add_option(6, 3, "MUSIC VOLUME: ", noone);
}