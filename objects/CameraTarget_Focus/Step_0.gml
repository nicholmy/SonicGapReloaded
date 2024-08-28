/// @description Insert description here
// You can write your code in this editor

if (!isActive and object_check_player(ColTrigger)) {
	isActive = true;
	
	with Camera {
		Target = other.id;
	}
}

if (isActive and !object_check_player(ColTrigger)) {
	isActive = false;
	
	with Camera {
		Target = Player;
	}
}