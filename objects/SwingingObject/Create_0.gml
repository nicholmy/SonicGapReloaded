/// @description Startup
// You can write your code in this editor
	
	/* Variable Definitions	
	1. ChainCount, default = 4
	*/
	
	// Setup object
	switch room
	{
		case SpStage_TT_4:
		{
			var Solidbox = [28, 28];
			SpriteData   = [spr_obj_swing_tsz_chain, spr_obj_swing_tsz_pendulum];
			Object = Buzzsaw;
		}
		break;
		default:
		{
			var Solidbox = [0, 0];
			SpriteData   = [spr_controller_object, spr_controller_object];
					    /* [chain,				  pendulum] */
		}
	}
	
	OriginX   = x;
    OriginY   = y;
	DistanceX = 0;
	DistanceY = 0;
	// Set object properties
	object_set_unload(FlagPause);
	object_set_depth(Player, 0);
    //object_set_solidbox(Solidbox[0], Solidbox[1], false);
	PendulumObject = instance_create(x, y, Object);