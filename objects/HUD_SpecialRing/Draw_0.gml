/// @description Draw the ring with the checkmark

draw_self();
// [9, 10, 11, 12, 13, 14]
var courseFlags = get_courserings(global.LastCourseID);

show_debug_message("Course Flags");
show_debug_message("Ring ID:" + string(ringID));
for (var i = 0; i < 6; i++) {
	show_debug_message(string(courseFlags[i]));
}
var courseFlag = courseFlags[ringID]
isCollected = (global.SpecialRingList2[courseFlag] == 1)
if (isCollected) draw_sprite(spr_obj_checkmark, 0, x, y);