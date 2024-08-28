/// @description State Management
// State 0 = Detracted spikes
// State 1 = Extending spikes
// State 2 = Extended spikes
// State 3 = Detracting spikes

// Inherit the parent event (Lower the spike timer)
//event_inherited();

// Act as badnik and exit if it was destroyed
if object_act_enemy(EnemyBadnik)
{
	return;
}

if (state == 0) {
	spikeRadius = minSpikeRadius;
	
	// Don't extend if the flag isn't set
	if (isExtendable and distance_to_object(Player) < senseDistance and !Player.Death) {
		state = 1;
	}
}

if (state == 1) {
	spikeRadius += spikeExtendSpeed;
	
	if (spikeRadius >= maxSpikeRadius) {
		state = 2;
	}
}

if (state == 2) {
	spikeRadius = maxSpikeRadius;
	
	if (distance_to_object(Player) > senseDistance and !Player.Death) {
		state = 3;
	}
}

if (state == 3) {
	spikeRadius -= spikeExtendSpeed;
	
	if (spikeRadius <= minSpikeRadius) {
		state = 0;
	}
}

if (trackPlayer) {
	if (Player.x > x) {
		image_xscale = -1;
	} else if (Player.x < x) {
		image_xscale = 1;
	}
}

spikeAngle += rotateSpeed;
x += moveSpeed;