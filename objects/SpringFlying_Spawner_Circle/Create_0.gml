/// @description Set initial positions
// You can write your code in this editor
obj_list = array_create(spawnCount);

for (var i = 0; i < array_length(obj_list); i++) {
	var initAngle = i * (360 / spawnCount) + angleOffset;
	var initX = x + radius*dcos(initAngle);
	var initY = y - radius*dsin(initAngle);
	
	obj_list[i] = instance_create(initX, initY , SpringFlying);
}


