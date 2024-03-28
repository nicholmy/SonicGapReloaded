/// @description Main
// You can call your scripts in this editor

	// Play animation in sync with all rings
	animation_play_sync(sprite_index, 8);
	
	// Collect ring
	if !Player.Hurt and Player.InvincibilityFrames < 90
	{	
		if object_check_player(ColHitbox)
		{
			Stage.RingsLeft--;
			audio_sfx_play(sfxRingMono, false);
	
			instance_create(x, y, RingSparkle);	
			instance_destroy();	
		}
	}
	
	if (decayTime > 0) {
		if (decayTimeLeft <= 0) instance_destroy();
		if (decayTimeLeft > 0) decayTimeLeft--;
		if (decayTimeLeft < decayTime * blinkStart) isBlinking = true;
	}
	