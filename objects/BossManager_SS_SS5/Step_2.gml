/// @description Watch for Eggy to get blown up, that counts as defeated
if (instance_exists(boss) and boss.state == 2) {
	state = 1;
	defeated = true;
	SpecialStage_Base.BossToggleHUD = false;
}
