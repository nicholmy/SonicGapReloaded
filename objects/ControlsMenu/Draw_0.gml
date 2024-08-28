/// @description Insert description here
// You can write your code in this editor

// Set font and its align
	draw_set_font(Font.FontMenu);
	draw_set_halign(fa_center);

// Display header
    draw_text(global.Width / 2, global.Height / 2 - 62, MenuHeader[MenuID]);
	if (menuActive) {
		
		// Display options
	    var Page  = OptionID div 7;
	    var Limit = min(array_length_1d(MenuOption[MenuID]), Page * 7 + 7);
    
	    for (var i = Page * 7; i < Limit; i++)
	    {
	        draw_text(global.Width / 2, global.Height / 2 - 12 + i mod 7 * 16, MenuOption[MenuID][i]);
	    }

		// Display pointer
	    var OptionLength = string_length(MenuOption[MenuID][OptionID]) * 8;
	    var PointerY     = global.Height / 2 - 12 + OptionID mod 7 * 16;
    
	    draw_text((global.Width - OptionLength - 32) / 2, PointerY, ">");
	    draw_text((global.Width + OptionLength + 32) / 2, PointerY, "<");
	}
	if (MenuID == 1) {
		draw_text(global.Width/2, global.Height/2, "PRESS ANY KEY FOR");
		switch (SetupKeyID) {
			case 0: {
				draw_text(global.Width/2, global.Height/2 + 16, "(UP)");
				break;
			}
			case 1: {
				draw_text(global.Width/2, global.Height/2 + 16, "(DOWN)");
				break;
			}
			case 2: {
				draw_text(global.Width/2, global.Height/2 + 16, "(LEFT)");
				break;
			}
			case 3: {
				draw_text(global.Width/2, global.Height/2 + 16, "(RIGHT)");
				break;
			}
			case 4: {
				draw_text(global.Width/2, global.Height/2 + 16, "( A )");
				break;
			}
			case 5: {
				draw_text(global.Width/2, global.Height/2 + 16, "( B )");
				break;
			}
			case 6: {
				draw_text(global.Width/2, global.Height/2 + 16, "( C )");
				break;
			}
			case 7: {
				draw_text(global.Width/2, global.Height/2 + 16, "(MODE)");
				break;
			}
			case 8: {
				draw_text(global.Width/2, global.Height/2 + 16, "(START)");
				break;
			}
		}
	}
	
	if (MenuID == 2) {
		draw_text(global.Width/2, global.Height/2, "HOLD START TO EXIT");
	}



