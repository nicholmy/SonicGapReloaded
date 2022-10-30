/// @description Handle circular movement

for (var i = 0; i < array_length(obj_list); i++) {
	var newAngle = i * (360 / spawnCount) + angleOffset + ((Stage.Time * rotSpeed) mod 360);
	obj_list[i].x = x + radius*dcos(newAngle);
	obj_list[i].y = y - radius*dsin(newAngle);
}


