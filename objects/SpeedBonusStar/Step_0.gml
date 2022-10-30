/// @description Insert description here
// You can write your code in this editor

if (!State and object_check_player(ColHitbox)) {
	State = 1;
}

if (State and !object_check_player(ColHitbox)) {
	State = 0;
}


