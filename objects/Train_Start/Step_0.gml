/// @description Insert description here
// You can write your code in this editor
//timer = ++timer mod 450;

if (Train_Timer.timer == 250) {
	audio_sfx_play(sfxTrainPass, false);
	instance_create(x - 128, y, Train_Head);
}

for (var i = 0; i < array_length(bodySpawnTimes); i++) {
	if (Train_Timer.timer == bodySpawnTimes[i]) instance_create(x - 128, y, Train_Body);
}

if (Train_Timer.timer == 300) instance_create(x - 128, y, Train_Tail);