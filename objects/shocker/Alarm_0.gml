/// @description Spawn electricity

image_index = 1

// Left electricity
instance_create(x-8, y+electricYOffset, Shocker_Electricity_Left)

// Right electricity
instance_create(x+8, y+electricYOffset, Shocker_Electricity)

// PlaySound(snd_shield_use_electricity, global.SFXVolume, -1, true);
if (object_is_onscreen(id)) audio_sfx_play(sfxThunderBarrierJump, false);
alarm[0] = shockFreq
alarm[1] = 3