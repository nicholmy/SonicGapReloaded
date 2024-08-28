/// @description Insert description here
// You can write your code in this editor
state = 0;
//object_set_unload(FlagPause);
object_set_triggerbox(-192, 192, -256, 256);

enemyGoal = 3;
goalEnemyCount = instance_number(Enemy) - enemyGoal;
