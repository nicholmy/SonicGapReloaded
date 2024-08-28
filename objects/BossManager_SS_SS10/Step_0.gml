/// @description Insert description here
// You can write your code in this editor

/*
States:
0 - Not moving
1 - Spinning spikeballs
*/

switch state {
	case 0:
		spikeAngleSpd = 0;
		break;
	case 1:
		spikeAngles[0] += spikeAngleSpd * spikeDirection;
			
		while (spikeAngles[0] > 360) spikeAngles[0] -= 360;
		while (spikeAngles[0] < 0) spikeAngles[0] += 360;
			
		var angle = spikeAngles[0];
			
		for (var i = spikeCount-1; i >= 0; i--) {
			topSpikes[i].x = x + (spikeInitialRadius + spikeSepDistance*i) * dcos(angle);
			topSpikes[i].y = y - (spikeInitialRadius + spikeSepDistance*i) * dsin(angle);
		}
		
		with Eggmobile {
			if (alarm[0] == hitInvincTime - 1) {
				other.spikeDirection = -other.spikeDirection;
			}
			
			if (SpecialStage_Base.RingsLeft <= other.panicStart) {
				other.spikeAngleSpd = 2;
				
				if (!hittable) {
					other.spikeAngleSpd = 0;
				} else {
					face.state = 6;
				}
			}
		}
		
		spikeAngles[1] += spikeAngleSpd * spikeDirection;
			
		while (spikeAngles[1] > 360) spikeAngles[1] -= 360;
		while (spikeAngles[1] < 0) spikeAngles[1] += 360;
			
		var angle = spikeAngles[1];
			
		for (var i = spikeCount-1; i >= 0; i--) {
			bottomSpikes[i].x = x + (spikeInitialRadius + spikeSepDistance*i) * dcos(angle);
			bottomSpikes[i].y = y - (spikeInitialRadius + spikeSepDistance*i) * dsin(angle);
		}
		
		break;
}