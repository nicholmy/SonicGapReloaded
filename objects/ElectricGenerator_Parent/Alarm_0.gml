/// @description Generate electricity randomly
// Consider the edges and the width of the electricity itself

if (makeElecFlag) {
	instance_create(random_range(x - (sprite_width - 32)/2, x + (sprite_width -32)/2 ), y - 32, ElectricGenerator_Electricity);
	if (!audio_is_playing(sfxThunderBarrierJump)) audio_sfx_play(sfxThunderBarrierJump, false);

	alarm[0] = random_range(0,60);
}