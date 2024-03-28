/// @description Create Pieces
// You can write your code in this editor
ElecBase = instance_create(x,y,FaceFlamethrower_Base);
Hitbox = instance_create(x,y-32 * image_yscale,FaceFlamethrower_Hitbox);

ElecBase.image_yscale = image_yscale;
Hitbox.image_yscale = image_yscale;

// 0 = Inactive
// 1 = Active
state = 0;