/// @description Behave based on player's facing direction
// You can write your code in this editor

if (state != 0 and Player.Facing == -BlockFacing) {
	with FaceBlock {
		if (BlockFacing == other.BlockFacing) state = 0;
	}
}

if (state == 0 and object_check_player(ColSolidU)) {
	Player.OnObject = false;
	Player.Grounded = false;
}

if (Player.Facing == BlockFacing) {
	if (state == 0) {
		// If the player is inside a faceblock, play the sound for just one frame
		if (object_check_player(ColHitbox) or object_check_player(ColSolidR)) {
			audio_sfx_play(sfxMushroomBounce, false);
		}
		// Try to turn all blocks solid
		with FaceBlock {
			if (BlockFacing == other.BlockFacing) state = 1;
		}
	}

	if (state == 1) {
		// Check to see if the player is in ANY block
		var isIn = false;
		with FaceBlock {
			if (BlockFacing == other.BlockFacing) isIn = isIn or object_check_player(ColHitbox)
		}
	
		// If the player is not inside any blocks, its safe to make them all solid
		if (!isIn) state = 2;
		else {
			// If the player is inside ANY block, force them back
			if (Player.Grounded) Player.Gsp = -4 * BlockFacing;
			else Player.Xsp = -4 * BlockFacing;
		}
	}
}

if (state == 0 or state == 1) {
	object_act_solid(false, false, false, false);
}
if (state == 2) {
	object_act_solid(true, true, true, false);
}