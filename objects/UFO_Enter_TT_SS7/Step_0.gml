/// @description Trigger when the player reaches a certain amount of rings left
// TODO: Consider storing the layer id of the ufo as a variable for performance
if !State and layer_exists("UFO") and SpecialStage_Base.RingsLeft <= 68 {
	State = 1;
	
	ufo = instance_create_layer(Camera.ViewX - sprite_get_width(spr_ufo_arriving)/2, Camera.ViewY + global.Height/2, layer_get_id("UFO"), UFO);
	ufo.ufoID = ufoID;
}