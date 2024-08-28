/// @description Handle Main Input Events in Gap Results
// You can write your code in this editor
if (state == 0 and (Input.ABCPress or Input.StartPress)) {	
	state++;
	fade_perform(ModeInto, BlendWhite, 1);
	
	audio_play_sound(sfxSpecialWarp, 0, false);
	alarm[0] = 60;
}

/*
global.CourseTargets = [
		[36000, 4000, 30],
		[36000, 5000, 30],
		[36000, 6000, 50],
		[36000, 7000, 100],
		[36000, 8000, 30],
	]
*/
var playSound = false
// This is a list of the course's flags. [9, 10, 11, 12, 13, 14]
var courseFlags = get_courserings(global.LastCourseID);
var parTimeMet = global.LastTimeCleared < global.CourseTargets[global.LastCourseID][0];
var scoreMet = global.Score > global.CourseTargets[global.LastCourseID][1];
var ringsMet = global.Rings > global.CourseTargets[global.LastCourseID][2];

// Checking if goals are met
if (!global.SpecialRingList2[courseFlags[1]] and parTimeMet and scoreMet) {
	global.SpecialRingList2[courseFlags[1]] = 1;
	playSound = true;
}

if (!global.SpecialRingList2[courseFlags[2]] and parTimeMet and ringsMet) {
	global.SpecialRingList2[courseFlags[2]] = 1;
	playSound = true;
}

if (!global.SpecialRingList2[courseFlags[3]] and global.CoolBonus == true) {
	global.SpecialRingList2[courseFlags[3]] = 1;
	playSound = true;
}

if (!global.SpecialRingList2[courseFlags[4]] and global.SONICBonus == true) {
	global.SpecialRingList2[courseFlags[4]] = 1;
	playSound = true;
}

if (playSound == true) {
	audio_sfx_play(sfxEmerald, false);
	playSound = false;
}