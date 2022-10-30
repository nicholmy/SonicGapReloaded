/// @description Draw
// You can write your code in this editor
	
	draw_rectangle_color(global.Width / 2 - 100, global.Height / 2 - 68, global.Width / 2 + 100, global.Height - 50, c_black, c_black, c_black, c_black, c_black);
	
	// Display header
    draw_text(global.Width / 2, global.Height / 2 - 62, MenuHeader[MenuID]);
    
    // Display options
    var Page  = OptionID div 7;
    var Limit = min(MenuSize[MenuID], Page * 7 + 7);
    
    for (var i = Page * 7; i < Limit; i++)
    {
        draw_text(global.Width / 2, global.Height / 2 - 12 + i mod 7 * 16, MenuOption[MenuID][i]);
    }
    
    // Display page number
    var AllPages = (MenuSize[MenuID] - 1) div 7;
    if  AllPages
    {
        draw_text(global.Width / 2, global.Height / 2 - 46, "-" + string(Page + 1) + "/" + string(AllPages + 1) + "-");
    }
    
    // Display pointer
    var OptionLength = string_length(MenuOption[MenuID][OptionID]) * 8;
    var PointerY     = global.Height / 2 - 12 + OptionID mod 7 * 16;
    
    draw_text((global.Width - OptionLength - 32) / 2, PointerY, ">");
    draw_text((global.Width + OptionLength + 32) / 2, PointerY, "<");