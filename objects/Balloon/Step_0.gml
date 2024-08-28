/// @description Insert description here
// You can write your code in this editor

if (object_check_player(ColHitbox) and !Player.Death and !Player.Hurt) {
	Player.Ysp     = -7;
	// Player should be airborne now
	Player.Grounded = false;
	Player.OnObject = false;
	player_reset_air(true);
	instance_destroy();
}