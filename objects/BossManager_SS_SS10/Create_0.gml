/// @description Manages where Eggmobile moves on SS_SS_10
// Also serves as a point of origin for the convenience of moving to places
defeated = false;
state = 0;
boss = instance_create(x, y, Eggmobile);
boss.Health = 8;
boss.image_xscale = -1;
boss.defeatable = false;
panicStart = 5;

spikeMaxSpd = 1;
spikeAngleSpd = 1;
spikeInitialRadius = 96;
spikeSepDistance = 48;
spikeDirection = 1;
spikeAngles = [90, 270];
alarm[0] = 60;

//spike1 = instance_create(x + spikeRadius * dcos(spikeAngles[0]), y - spikeRadius * dsin(spikeAngles[0]), Eggmobile_Spikeball_M);
//spike2 = instance_create(x + spikeRadius * dcos(spikeAngles[1]), y - spikeRadius * dsin(spikeAngles[1]), Eggmobile_Spikeball_M);

spikeCount = 2;
topSpikes = [];
bottomSpikes = [];

// Initialize backwards unless this is html5 but not doing that
for (var i = spikeCount-1; i >= 0; i--) {
	topSpikes[i] = instance_create(x + (spikeInitialRadius + spikeSepDistance*i) * dcos(90), y - (spikeInitialRadius + spikeSepDistance*i) * dsin(90), Eggmobile_Spikeball_M);
	bottomSpikes[i] = instance_create(x + (spikeInitialRadius + spikeSepDistance*i) * dcos(270), y - (spikeInitialRadius + spikeSepDistance*i) * dsin(270), Eggmobile_Spikeball_M);
}

///spikeList = [topSpikes, bottomSpikes]