/// @description Insert description here
// You can write your code in this editor

var count = 0;
var flagList = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
for (var i = 0; i < array_length(flagList); i++) {
	if (global.RedRingList2[i]) {
		count += 1;
	} 
}
	
if count >= 10 {
	instance_create(x, y, obj_BG_StarStation_Act3);
}
else if count >= 3 {
	instance_create(x, y, obj_BG_StarStation_Act2);
}
else {
	instance_create(x, y, obj_BG_StarStation_Act1);
}




