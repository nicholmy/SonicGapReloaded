/// @description Set init properties
// You can write your code in this editor

/*
State
0 - Invisible
1 - Visible, Honing on Player (Small), Slow Sounds
2 - Honing on Player (Small), Faster Sounds
3 - Faster Sounds, Honing on Player (Large)
4 - Animation Change, Stops Following the Player
5 - Shot is out
6 - Shot is disappearing
*/

State = 0;
shootTimer = 0;
followPlayer = false;

object_set_hitbox(0, 0);
object_set_depth(Player, 1);






