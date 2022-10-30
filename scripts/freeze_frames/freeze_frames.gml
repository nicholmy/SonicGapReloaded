// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function freeze_frames(freezeDur){
	var totalTime = current_time + freezeDur;
	while (current_time < totalTime) {};
}