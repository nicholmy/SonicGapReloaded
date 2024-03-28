/// @description Spawn pollen somewhere off screen
var screenX = Camera.ViewX;
var screenY = Camera.ViewY;
var screenWidth = global.Width;
var screenHeight = global.Height;

var pollenX = screenX + screenWidth
var pollenY = random_range(screenY, screenY + screenHeight)

instance_create(pollenX, pollenY, Pollen_White);
alarm[0] = spawnSpd