/// @description Insert description here
// You can write your code in this editor
if (object_check_player(ColTrigger) and Player.MoveState == StateCurrent) {
	player_reset_movestate();
	Player.Ysp = 0;
	with CurrentStart {
		active = false;
	}
}