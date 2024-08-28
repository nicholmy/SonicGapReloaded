/// @description Insert description here
// You can write your code in this editor

if Input.BPress and MenuID == 0
{
	room_goto(Screen_DevMenu);
}

if (menuActive) {
	if (Input.DownPress) {
		OptionID += 1;
	}
	else if (Input.UpPress) {
		OptionID -= 1;
	}

	OptionID = loop_value(OptionID, 0, MenuSize[MenuID] - 1);

	if (Input.APress or Input.StartPress) {
	
		if (MenuID == 0 and OptionID == 1) {
			MenuID = 1;
			menuActive = false;
			SetupKeyID = 0;
			SetupCanEnter = 1;
		} else if (OptionID == 0) {
			MenuID = 2;
			menuActive = false;
		} else if (OptionID == 2) {
			room_goto(Screen_DevMenu);
		}
	}
}

if (MenuID == 2) {
	if (Input.Start) {
		startTimer++;
	} else {
		startTimer = 0;
	}
	
	if (startTimer == 120) {
		MenuID = 0;
		menuActive = true;
	}
}
/*
// Make the menu wrap around
var _size = );
if OptionID < 0 OptionID = _size - 1;
else if OptionID >= _size OptionID = 0;

/*switch (index) {
	
}*/