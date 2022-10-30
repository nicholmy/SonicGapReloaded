/// @ Called in Discord Controller -> Room Start Event
function DiscordSetup()
{
	/* Please note that default ID provides some basic icons
	we made. For your own fangame, create your own application at Discord RP website!
	
	ID can be set in Discord -> Game Start Event */
	
	switch room 
	{
		case Stage_TSZ:
			TopString = "Test Stage";
		break;
		case Stage_TestGap:
			TopString = "Test Gap Stage";
		break;
		case Stage_StarStation:
			TopString = "Star Station 1";
		break;
		case Stage_StarStation2:
			TopString = "Star Station 2";
		break;
		case SpStage_Test:
		case Screen_SStage:
		case SpStage_SS_1:
		case SpStage_SS_2:
		case SpStage_SS_3:
		case SpStage_SS_4:
		case SpStage_SS_5:
			TopString = "Special Stage";
		break;
		case BStage_Template:
			TopString = "Bonus Stage";
		break;
		default:
			TopString = "In Menus";
	}
	
	if TopString != "In Menus"
	{
		switch global.Character
		{
			case CharSonic:    
				var Char = "Sonic";
			break;
			case CharTails:	   
				var Char = "Tails";   
			break;
			case CharKnuckles: 
				var Char = "Knuckles";
			break;
			case CharMighty:
				var Char = "Mighty";
			break;
			default:		  
				var Char = "";
		}
		/*
		if global.Emeralds != 1
		{
			TopString += " (" + string(global.Emeralds) + " Chaos Emeralds)";
		}
		else
		{
			TopString += " (" + string(global.Emeralds) + " Chaos Emerald)";
		}
		*/
		BottomString = Char;	
	}
	else
	{
		BottomString = "";
	}
	
	// Set images
	MainImage      = "orbinaut";
	MainImageDesc  = "";
	SmallImageDesc = "";
	SmallImage     = "";
}