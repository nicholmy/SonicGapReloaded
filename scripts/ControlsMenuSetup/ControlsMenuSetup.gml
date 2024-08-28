// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ControlsMenuSetup(){
	global.CurrentAct = 0;
	audio_bgm_play(StarStation_Bonus, TechTree_Menu1);
	
	menu_add_header(0,    "SET CONTROLS");
	menu_add_option(0, 0, "UP",  1);
	menu_add_option(0, 1, "DOWN", 2);
	menu_add_option(0, 2, "LEFT", 3);
	menu_add_option(0, 3, "RIGHT", 4);
	menu_add_option(0, 4, "A", 5);	
	menu_add_option(0, 5, "B", 6);
	menu_add_option(0, 6, "C", 7);	
	menu_add_option(0, 7, "START", 8);
}