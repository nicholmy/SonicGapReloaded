// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function redringflags_count(flagList){
	var count = 0;
	for (var i = 0; i < flagList; i++) {
		if (flagList < 50 and global.RedRingList2[i] != 0) count++;
	}
	return count;
}