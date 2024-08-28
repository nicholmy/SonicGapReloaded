/// @description Insert description here
// You can write your code in this editor
// States:
// 0 - Waiting for player to enter
// 1 - Player has entered, defeating enemies
// 2 - All enemies defeated
if (object_check_player(ColTrigger)) {
	if (state == 0) {
		goalEnemyCount = instance_number(Enemy) - enemyGoal;
		state = 1;
	}
	if (state == 1) {
		var enemiesLeft = instance_number(Enemy) - goalEnemyCount;
		Stage.EventMessage = "ENEMIES LEFT: " + string(enemiesLeft)
		Stage.EventTimer = 60;
		
		if (enemiesLeft == 0) {
			state = 2;
		}
	}
	
	if (state == 2) {
		Stage.EventMessage = "COOL!";
		Stage.EventTimer = 60;
		alarm[0] = 10;
	}
}

if (state == 0) {
	with Door {
		if (doorID == 1) alarm[0] = 1;
	}
}

if (state == 1) {
	with Door {
		if (doorID == 1) alarm[1] = 1;
	}
}

if (state == 2) {
	with Door {
		if (doorID == 2) alarm[0] = 1;
	}
}



