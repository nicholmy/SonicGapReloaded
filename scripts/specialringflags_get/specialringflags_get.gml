// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function specialringflags_get(zoneID){
	switch zoneID
	{
		case 0:
			return [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
			break;
		case 1:
			return [15, 16, 17, 18, 19, 20, 21, 22]
			break;
		case 2:
			return [23, 24, 25, 26, 27, 28, 29, 30]
			break;
		case 3:
			return [31, 32, 33, 34, 35, 36, 37, 38]
			break;
		default:
			return []; 
			break;
	}

}