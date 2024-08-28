/// @description Set object properties
// You can write your code in this editor

/* 
States
0 - Arriving into background (at a smaller scale?)
1 - Approaching the player (getting bigger)
2 - Idle (Normal Scale)
3 - Hit/Exploding
4 - Leaving
5 - Out of Frame
6 - Dying

All UFOs are controlled by UFO_Cannons and Buttons
*/


State = 0;
MoveFrame = 0;
ExplodeTimer = 120;

object_set_solidbox(0, 0, false);
object_set_hitbox(0, 0);
object_set_triggerbox(0, 0, 0, 0);
object_set_unload(FlagPause);
animation_play(spr_ufo_arriving, 8, 0);






