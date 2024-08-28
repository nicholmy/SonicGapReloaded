/// @description Destroy Act 1's BG, Create Act 2's BG
// You can write your code in this editor

if (object_check_player(ColTrigger)) {
	with obj_BG_StarStation_Act1 {
		instance_destroy();
	}
	
	instance_create(0,0,obj_BG_StarStation_Act2);
}





