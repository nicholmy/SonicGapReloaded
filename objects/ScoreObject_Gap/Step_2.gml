/// @description Main
// You can write your code in this editor
	image_index = SpriteFrame;
	
	// Move object
	PosY += Ysp;
	Ysp  += 0.09375;
	
	if Ysp == 0
	{
		instance_destroy();
	}
	else
	{
		// Update position
		y = floor(PosY);
	}