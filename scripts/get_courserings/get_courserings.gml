// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_courserings(CourseID){
	switch CourseID {
		case 0:
			return [3, 4, 5, 6, 7, 8];
		break;
		case 1:
			return [9, 10, 11, 12, 13, 14];
		break;
		case 2:
			return [17, 18, 19, 20, 21, 22];
		break;
		case 3:
			return [25, 26, 27, 28, 29, 30];
		break;
		case 4:
			return [33, 34, 35, 36, 37, 38];
		break;
		case 5:
			return [43, 44, 45, 46, 47, 48];
		break;
		default:
			return [3, 4, 5, 6, 7, 8];
		break;
	}
}