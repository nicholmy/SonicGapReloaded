/// @description Set initial variables
// You can write your code in this editor
// Pull this from the save data
unlockedChars = [1, 1, 0, 0, 0, 0]
//originalChar = global.Character;

charAngles = [0, 60, 120, 180, 240, 300]

// Rotate the circle to the appopriate angle for the character selected
while (charAngles[global.Character] != 0) {
	for (var i = 0; i < 6; i++) {
		charAngles[i] += 60;
		if (charAngles[i] >= 360) charAngles[i] -= 360
		if (charAngles[i] < 0) charAngles[i] += 360
	}
}
circleRadius = 96;

angleLeft = 0;
rotationSpeed = 4;;
isRotating = false;

blinkFlag = true;
state = 0;
