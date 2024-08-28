/// @description Insert description here
// You can write your code in this editor

if (global.CurrentAct <= 0) {
	instance_create(x,y,obj_BG_StarStation_Act1);
} else {
	instance_create(x,y,obj_BG_StarStation_Act2);
}



