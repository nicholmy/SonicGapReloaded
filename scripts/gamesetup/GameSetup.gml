/// @ Called in Framework Controller -> Game Start Event
function GameSetup()
{
	// Game settings
	global.WindowTitle     = "Sonic Gap Reloaded";
	global.StartRoom	   = Screen_DevMenu;
	global.DevMode         = true;
	global.ShowSplash      = true;
	global.Width           = 400;
	global.Height		   = 224;
	global.ScreenBuffer    = 8;
	global.KeyboardControl = [vk_up, vk_down, vk_left, vk_right, ord("Z"), ord("X"), ord("C"), vk_space, vk_enter];
	
	/* Default (first-time-load) volume, screen size and fullscreen mode 
	are set in settings_load() function */
	
	/* Do not use boolean flags below in your code if you are going to add
	new character abilities. They are used to quickly turn off/on abilities and
	features ENTIRELY */
	
	// Originals differences. By defualt, the framework is in a "mix" state
	global.SpindashEnabled    = true;
	global.PeeloutEnabled	  = true;
	global.DropdashEnabled    = true;
	global.DSpinAttackEnabled = false;
	global.GroundSpeedcap	  = false;
	global.AirSpeedcap	      = false;
	global.RolljumpControl    = true;
	global.S2SpringBehaviour  = true;
	global.S2FloorCollision	  = true;
	global.S3SlopePhysics	  = false;
	global.S3WaterPhysics     = true;
	global.S3DeathRestart     = true;
	global.SKCrouch			  = false;
	global.SKRollDeceleration = true;
	global.SKWallCollision	  = true;
	global.SKItemBoxBehaviour = false;
	global.CDStageTimer	      = true;
	global.CDCamera			  = false;
	
	// Orbinaut improvements
	global.SmoothRotation	    = true;
	global.RichPresenceSupport  = true;
	global.PreciseRingBehaviour = false;
	global.FixRollJump		    = true;
	global.FixDashRelease		= true;
	global.NoRollSpeedLimit	    = false;
	global.FlightCancel	        = true;
	global.BetterPlayerTileGrip = true;
	
	// Initialise other variables. Do not edit these
	global.Character	   = 0;
	global.ActiveSave      = 0;
	global.SaveData		   = 0;
	global.SaveState       = 0;
	global.StartFullscreen = 0;
	global.WindowSize	   = 0;
	global.MusicVolume	   = 0;
	global.SoundVolume     = 0;
	global.Score		   = 0;
	global.RingBonus	   = 0;
	global.CoolBonus       = 0;
	global.ChainBonus	   = 0;
	global.Lives		   = 0;
	global.Continues	   = 0;
	global.Emeralds	       = 0;
	global.SpecialRings	   = 0;
	global.RedRings		   = 0;
	global.ZoneID		   = 0;
	global.ReturnRoom       = 0;
	//global.LevelFinished   = 0;
	global.SpecialScore    = 0;
	global.SpecialState    = 0;
	global.GameStartTime   = 0;	
	global.StarPostData    = [];
	global.BonusStageData  = [];
	global.SpecialRingData = [];
	global.InSpecialStage = false;
	global.LastZoneCleared = 0;
	global.LastScoreTarget = 0;
	/*
	global.SpecialRingList = [
		[0,0,0,0,0,0,0,0,0]
	];
	global.RedRingList = [
		[0,0,0,0,0]
	];*/
	savedata_reset();
	
	// Font setup
	Font.FontDefault = font_add_sprite_ext(font_default, "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890*.:!-+", false, 0);
	Font.FontMenu    = font_add_sprite_ext(font_menu, "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789:-></", false, 1);
	Font.FontCard    = font_add_sprite_ext(font_card, "ABCDEFGHIJKLMNOPQRSTUVWXYZ_", true, 1);
	Font.FontDigits1 = font_add_sprite_ext(font_counter, "0123456789:';", false, 1);
	Font.FontDigits2 = font_add_sprite_ext(font_counter_small, "0123456789", false, 1);
}