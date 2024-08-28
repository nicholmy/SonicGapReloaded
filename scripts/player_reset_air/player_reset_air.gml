/// @function player_damage(isFlame,isThunder,instantKill)
function player_reset_air(allowActions)
{	
	with Player {
		Animation		= AnimSpin;
		RadiusX			= DefaultRadiusX;
		RadiusY			= DefaultRadiusY;
		//AirLock			= true;
		Grounded		= false;
		OnObject		= false;
		Jumping			= false;
		Spinning		= true;
		
		if (FlightState) { Grv = 0.21875; }
		FlightState		= false;
		
		if (GlideState) { Grv = 0.21875; }
		// Might need to reset the gravity properly underwater
		GlideState		= false;
		ClimbState		= false;
		
		RayFlightState	= false;
		HammerState		= false;
		PeeloutRev		= -1;
		SpindashRev		= -1;
		DropdashRev		= -1;
		DropdashFlag	= DashLocked;
		BarrierIsActive = false;
		Hanging = false;
		AllowMovement = true;
		AllowGravity = true;
		MoveState = StateCommon;
		
		
		
		if (allowActions) {
			//TODO: Need to decouple cutting jump height and being able to do mid-air actions
			Jumping = true;
			BarrierIsActive = false;
			DoubleSpinAttack = SpinReady;
			DropdashFlag = DashReady;
		}
	}
	
	audio_sfx_stop(sfxFlying);
	audio_sfx_stop(sfxTired);
}