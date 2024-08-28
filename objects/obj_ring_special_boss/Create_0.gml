/// @description Set initial state
// You can write your code in this editor
state = 0;
// 0 - Not Unlocked
// 1 - Unlocked
// 2 - Completed
//isCollected = (global.SpecialRingList[zoneID][ringID] == 2)
isCollected = (global.RedRingList2[ringID] == 1)

object_set_unload(FlagPause);
object_set_depth(Player, 0);
object_set_hitbox(16, 16);