/// @description Insert description here
// You can write your code in this editor

/* 
States
0 = Hiding
1 = Appearing
4 = Taunting
2 = Shooting
3 = Disappearing
*/

state = 0;
oneShotFlag = false;
shootTimer = 0;
shootInterval = 10;
appearDistance = 156;

// Set object properties
	object_set_unload(FlagReset);
	object_set_depth(Player, 0);
	object_set_hitbox(20, 20);


