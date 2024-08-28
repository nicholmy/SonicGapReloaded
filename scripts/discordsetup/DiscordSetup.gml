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
		case Stage_Tutorial:
			TopString = "Sky Station Tutorial";
		break;
		case Map_SkyStation:
			TopString = "Sky Station Map";
		break;
		case Map_TechTree:
			TopString = "Technology Tree Map";
		break;
		case Stage_StarStation:
			TopString = "Sky Station Course 1";
		break;
		case Stage_StarStation2:
			TopString = "Sky Station Course 2";
		break;
		case Stage_TechTree1:
			TopString = "Technology Tree Course";
		break;
		case Stage_TechTreeAmy:
			TopString = "Technology Tree Amy";
		break;
		case SpStage_Test:
		case Screen_SStage:
		case SpStage_SS_1:
		case SpStage_SS_2:
		case SpStage_SS_3:
		case SpStage_SS_4:
		case SpStage_SS_5:
		case SpStage_SS_6:
		case SpStage_SS_7:
		case SpStage_SS_8:
		case SpStage_SS_9:
		case SpStage_SS_10:
			TopString = "Star Station Special";
		break;
		case SpStage_TT_1:
		case SpStage_TT_2:
		case SpStage_TT_3:
		case SpStage_TT_4:
		case SpStage_TT_5:
		case SpStage_TT_6:
		case SpStage_TT_7:
		case SpStage_TT_8:
		case SpStage_TT_9:
			TopString = "Tech Tree Special";
		break;
		case SpStage_VV_1:
			TopString = "Vivid Voyage Special";
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
			case CharRay:
				var Char = "Ray";
			break;
			case CharAmy:
				var Char = "Amy";
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