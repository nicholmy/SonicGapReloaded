// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// Don't want to do this every frame the char is in Common. At least not yet
function player_reset_movestate(){
	with Player {
		MoveState = StateCommon;
	
		AllowMovement = true;
		AllowGravity = true;
		AirLock = true;
	}
}