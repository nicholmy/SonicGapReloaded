/// @description Handle Rotation
// You can write your code in this editor
if (!isRotating and Input.RightPress) {
	global.Character--;
	while (global.Character < 0) global.Character += 6;
	angleLeft = 60;
	rotationSpeed = 4;
	isRotating = true;
	
	audio_sfx_play(sfxSwitch, false);
}

if (!isRotating and Input.LeftPress) {
	
	
	global.Character = ++global.Character mod 6;
	
	angleLeft = 60;
	rotationSpeed = -4;
	isRotating = true;
	
	audio_sfx_play(sfxSwitch, false);
}

if (isRotating and angleLeft > 0) {
	for (var i = 0; i < 6; i++) {
		charAngles[i] += rotationSpeed;
		if (charAngles[i] >= 360) charAngles[i] -= 360
		if (charAngles[i] < 0) charAngles[i] += 360
	}
		
	angleLeft -= abs(rotationSpeed);
	
	if (angleLeft <= 0) {
		angleLeft = 0;
		isRotating = false;
	}
}