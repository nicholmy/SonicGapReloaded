/// @description Insert description here
// You can write your code in this editor

state = 0;


Player.Ysp = bounceStrength[bounceState];
Player.Jumping = false;
Player.AirLock = false;

audio_sfx_play(sfxSpring, false);
lockTimer = 15;
bounceState = (bounceState + 1) mod 3;




