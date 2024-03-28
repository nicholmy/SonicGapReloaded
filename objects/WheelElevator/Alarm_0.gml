/// @description Release the player and fall
state = -1;
Ysp = 0;

if (object_check_player(ColSolidU)) {
	// Player should be airborne now
	Player.OnObject = false;
	Player.Grounded = false;
}





