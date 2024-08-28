/// @description Manages where Eggmobile moves on SS_SS_5
// Also serves as a point of origin for the convenience of moving to places
defeated = false;
state = 0;
boss = instance_create(x-96, 0, Eggmobile);
boss.Health = 10;
pinchHealthStart = 4;
SpecialStage_Base.BossToggleHUD = true;
SpecialStage_Base.BossHealthMax = boss.Health;

leftTargetX = x - 128;
leftTargetY = y;
rightTargetX = x + 128;
rightTargetY = y;

switchTimer = 0;
switchTimerMax = 60;

circleRadius = 64;
circleSpeed = 3;
circleAngle = 90;
circleCenterTarget = [x, y-16];

/*
States:
0 - Eggman is moving into the screen
1 - Eggman has lost
2 - Movement states
*/