/// @ Called in Framework Controller -> Room Start Event
function CollisionSetup()
{
	switch room
	{
		case Stage_TSZ:
			tile_data_set("", TileCount, "CollisionLayerA", "CollisionLayerB");
		break;
		case Stage_TSZ2:
			tile_data_set("", TileCount, "CollisionLayerA", "CollisionLayerB");
		break;
		case Stage_TestGap:
			tile_data_set("", TileCount, "CollisionLayerA", "CollisionLayerB");
		break;
		case Stage_StarStation:
			tile_data_set("", TileCount, "CollisionLayerA", "CollisionLayerB");
		break;
		case Stage_StarStation2:
			tile_data_set("", TileCount, "CollisionLayerA", "CollisionLayerB");
		break;
		case SpStage_Test:
			tile_data_set("", TileCount, "CollisionLayerA", "CollisionLayerB");
		break;
		case SpStage_Test_Rings:
			tile_data_set("", TileCount, "CollisionLayerA", "CollisionLayerB");
		break;
		case SpStage_Test_Enemies:
			tile_data_set("", TileCount, "CollisionLayerA", "CollisionLayerB");
		break;
		case SpStage_SS_1:
			tile_data_set("", TileCount, "CollisionLayerA", "CollisionLayerB");
		break;
		case SpStage_SS_2:
			tile_data_set("", TileCount, "CollisionLayerA", "CollisionLayerB");
		break;
		case SpStage_SS_3:
			tile_data_set("", TileCount, "CollisionLayerA", "CollisionLayerB");
		break;
		case SpStage_SS_4:
			tile_data_set("", TileCount, "CollisionLayerA", "CollisionLayerB");
		break;
		case SpStage_SS_5:
			tile_data_set("", TileCount, "CollisionLayerA", "CollisionLayerB");
		break;
		default:
			tile_data_set(noone, "", "", "");
	}
}