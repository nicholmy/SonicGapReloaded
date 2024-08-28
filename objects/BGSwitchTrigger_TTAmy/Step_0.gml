/// @description Destroy Act 1's BG, Create Act 2's BG
// You can write your code in this editor

if (object_check_player(ColTrigger)) {
	with obj_BG_TechTree_Act1_v2 {
		instance_destroy();
	}
	
	if (!instance_exists(obj_BG_TechTree_Act2))
		instance_create(0,0,obj_BG_TechTree_Act2);
}





