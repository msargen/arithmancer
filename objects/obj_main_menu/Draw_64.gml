/// @description Draw Menu

scr_draw_set_text(c_white, fnt_menu, fa_right, fa_bottom);

for (var _i = 0; _i <= main_menu_items; _i++)
{
	var _txt = main_menu_options[_i];
	var _col = c_gray;
	if (main_menu_cursor == _i)
	{
		_txt = string_insert("> ", _txt, 0);
		_col = c_white;
	}
	
	var _yy = main_menu_y - (main_menu_item_height * _i);
	scr_draw_text_outline(main_menu_x, _yy, _col, c_black, global.text_offset, _txt, 0.5);
}

// Prevents the menu options slide in from being seen
draw_set_color(c_black);
draw_rectangle(main_menu_gui_width, 0, main_menu_gui_width + main_menu_gui_width, main_menu_gui_height, false);