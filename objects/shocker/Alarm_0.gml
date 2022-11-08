/// @description Spawn electricity

// Left electricity
instance_create(x-38, y+electricYOffset * image_yscale, Shocker_Electricity_Left)

// Right electricity
instance_create(x+38, y+electricYOffset * image_yscale, Shocker_Electricity)

// PlaySound(snd_shield_use_electricity, global.SFXVolume, -1, true);
if (object_is_onscreen(id)) audio_sfx_play(sfxThunderBarrierJump, false);
alarm[0] = shockFreq
alarm[1] = 4
state = 1;