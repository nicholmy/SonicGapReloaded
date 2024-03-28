/// @description Put the player in the barrel
// You can write your code in this editor
if (state < 1 and !(Player.Hurt or Player.Death or Player.DebugMode)) {
	audio_sfx_play(sfxRoll, false);
	state = 1;
}