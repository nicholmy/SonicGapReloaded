// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerMovementState(){
	if (MoveState == StateCommon)
		return;
	
	if (MoveState == StateCurrent) {
		//player_reset_air(false);
		Grounded = false;
		AllowGravity = false;
		Animation = AnimHurt;
	}
}