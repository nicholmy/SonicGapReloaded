/// @ Called in DefaultMenu Controller -> Create Event
function TTMenuSetup()
{
	ZoneID = 1;
	audio_bgm_play(AudioPrimary, TechTree1)
	
	menu_add_header(0,    "SONIC GAP RELOADED" + "\n\nTECHNOLOGY TREE");
	menu_add_option(0, 0, "- -",   noone);
	menu_add_option(0, 1, "SPECIAL STAGES", 3);
	menu_add_option(0, 2, "CHARACTER SELECT", 1);
	menu_add_option(0, 3, "ZONE SELECT", 4);	
	menu_add_option(0, 4, "BACK TO TITLE",    noone);
	
	// Character Select
	menu_add_header(1,    "SELECT A PLAYER");
	menu_add_option(1, 0, "SONIC",	  0);
	menu_add_option(1, 1, "TAILS",	  0);
	menu_add_option(1, 2, "KNUCKLES", 0);
	menu_add_option(1, 3, "MIGHTY", 0);
	menu_add_option(1, 4, "RAY", 0);
	
	// Stage Select
	menu_add_header(2,    "SELECT A STAGE");
	menu_add_option(2, 0, "BOSS", Stage_TechTreeBoss);

	
	menu_add_header(3,    "SELECT A SPECIAL STAGE");
	menu_add_option(3, 0, "STAGE 1", SpStage_TT_1);
	
	// Zone Select
	menu_add_header(4,    "SELECT A ZONE");
	menu_add_option(4, 0, "SKY STATION", Screen_SkyStation);
	
	// Options
	menu_add_header(6,    "OPTIONS");
	menu_add_option(6, 0, "FULLSCREEN: ",   noone);
	menu_add_option(6, 1, "WINDOW SIZE: ",  noone);
	menu_add_option(6, 2, "SOUND VOLUME: ", noone);
	menu_add_option(6, 3, "MUSIC VOLUME: ", noone);
}