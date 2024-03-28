/// @description Startup 2
// You can write your code in this editor
	
	/* Create orbs. We do it here to make sure this happens only once, because if object
	has unload flag set to FlagReset, its Create Event is called again when object unloads */
	
	var ThisObject = id; 
	for (var i = 0; i < 4; i++)
	{
		Orb[i] = instance_create(x + OrbRadius * dsin(90 * i), y + OrbRadius * dcos(90 * i), OrbinautOrb);
		with Orb[i]
		{
			object_set_depth(ThisObject, 1);
		}
	}
