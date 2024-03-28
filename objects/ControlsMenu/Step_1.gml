/// @description Insert description here
// You can write your code in this editor

if (MenuID == 1) {
	switch (SetupKeyID) {
		case 0:
		case 1:
		case 2:
		case 3:
		case 4:
		case 5:
		case 6:
		case 7:
		case 8:
		{
            if(keyboard_check_pressed(vk_anykey)){
                global.KeyboardControl[SetupKeyID] = keyboard_key;
                SetupCanEnter = 0;
                SetupKeyID++
            }

			break;
		}
		case 9: {
			MenuID = 0;
			menuActive = true;
			SetupKeyID = 0;
			break;
		}
	}
}






