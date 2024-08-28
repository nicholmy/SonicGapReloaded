/// @description Insert description here
// You can write your code in this editor

/*
States
0 = Normal
1 = Happy
2 = In Shock, Exploding
3 = Drop down then Raise a bit
*/

switch state {
	case 0:
		if (hittable and object_act_enemy(EnemyBoss)) {
			// Show eggman's shock
			face.state = 2;
			// Make the body flash
			body.state = 1;
	
			if (defeatable) Health--;
	
			// Make the eggmobile unhittable
			hittable = false;
			alarm[0] = hitInvincTime;
		}

		/* if (!hittable) {
			// Make eggman stay still for a sec
			Xsp = 0;
			Ysp = 0;
		} */
		
		if (Health <= 0) {
			state = 2;
			alarm[1] = 200;
		}
		
		if (speed > 0) {
			flame.state = 1;
		} else {
			flame.state = 0;
		}
		break;
	case 1:
		face.state = 3;
		body.state = 0;
		break;
	case 2:
		face.state = 5;
		body.state = 2;
		Xsp = 0;
		Ysp = 0;
		break;
	case 3:
		face.state = 5;
		body.state = 0;
		flame.state = 0;
		vspeed = 3;
		break;
	case 4:
		face.state = 5;
		body.state = 0;
		flame.state = 1;
		vspeed = -1;
		break;
	case 5:
		// Eggman's engine fire goes off in a burst first here, not sure how to implement that yet
		face.state = 6;
		body.state = 0;
		flame.state = 3;
		//Xsp = 5;
		//Ysp = -1;
		hspeed = 5;
		vspeed = -1;
		image_xscale = 1;
	default:
		break;
}

// That's right, Eggman could be dying but he's sure happy you're dying too
/*if (Player.Death or Player.Hurt) {
	face.state = 3;
}*/



//x += floor(Xsp);
//y += floor(Ysp);

body.x = x + body.offsetX * image_xscale;
body.y = y+8;
body.image_xscale = image_xscale;
face.x = x + face.offsetX * image_xscale;
face.y = y-20;
face.image_xscale = image_xscale;
flame.x = x + flame.offsetX * image_xscale;
flame.y = y+4;
flame.image_xscale = image_xscale;