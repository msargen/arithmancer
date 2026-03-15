/// @description Draw Menu

scr_draw_set_text(c_white, global.menu_font, fa_right, fa_bottom);

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
	draw_set_colour(_col)
	draw_text(main_menu_x, _yy, _txt)
}

// Prevents the menu options slide in from being seen
draw_set_color(c_black);
draw_rectangle(RES_W, 0, RES_W + RES_W, RES_H, false);