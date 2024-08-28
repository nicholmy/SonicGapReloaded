/// @description Sync with the Camera
// You can write your code in this editor

switch State {
	case 0:
		x = Camera.ViewX + 2 * MoveFrame;
		y = Camera.ViewY + global.Height/2;
		
		MoveFrame++;
		
		if (x >= Camera.ViewX + global.Width/2) {
			animation_play(spr_ufo_approaching, 8, 7);
			State = 1;
		}
		break;
	case 1:
		MoveFrame = 0;
		image_xscale += 0.005
		image_yscale += 0.005
		
		if (image_xscale >= 1) {
			animation_play(spr_ufo_idle, 8, 0);
			targetObj = instance_create(x, y, UFO_Target);
			State = 2;
		}
		x = Camera.ViewX + global.Width/2
		y = Camera.ViewY + global.Height/2
		break;
	case 3:
		with UFO_Target {
			instance_destroy();
		}
		if (ExplodeTimer % 5 == 0) {
			instance_create_layer(x+random(1), y+random(1), layer_get_id("UFO"), FireExplosion);
		}
		if (ExplodeTimer % 10 == 0) {
			instance_create_layer(x + 55 + random(50), y - 12 + random(50), layer_get_id("UFO"), FireExplosion);
			instance_create_layer(x -83 + random(50), y -12 + random(50), layer_get_id("UFO"), FireExplosion);
			audio_sfx_play(sfxExplosion, false);
		}
		ExplodeTimer--;
		
		if (ExplodeTimer <= 0) {
			State = 6;
			MoveFrame = 0;
		}
		x = Camera.ViewX + global.Width/2;
		y = Camera.ViewY + global.Height/2;
		break;
	case 4:
		with UFO_Target {
			instance_destroy();
		}
		x = Camera.ViewX + global.Width/2 - 4 * MoveFrame;
		y = Camera.ViewY + global.Height/2;
		
		MoveFrame++;
		
		if (x < Camera.ViewX - sprite_get_width(spr_ufo_arriving)/2) {
			State = 5;
		}
		break;
	case 5:
		x = Camera.ViewX - Camera.ViewX - sprite_get_width(spr_ufo_arriving)/2
		y = Camera.ViewY + global.Height/2;
		break;
	case 6:
		x = Camera.ViewX + global.Width/2;
		y = Camera.ViewY + global.Height/2 + 2 * MoveFrame;
		image_angle += 4;
		if (y > Camera.ViewY + global.Height + sprite_get_height(spr_ufo_arriving)) {
			instance_create_layer(Camera.ViewX + global.Width/2,Camera.ViewY + global.Height/2, layer_get_id("UFO"), UFO_Explosion);
			audio_sfx_play(sfxExplosion, false);
			instance_destroy();
		}
		MoveFrame++;
		break;
	case 2:
	default:
		x = Camera.ViewX + global.Width/2;
		y = Camera.ViewY + global.Height/2;
		break;
}







