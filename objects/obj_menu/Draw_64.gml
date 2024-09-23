/// @description Draw Menu

draw_set_font(fnt_menu);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

for (var _i = 0; _i < menu_items; _i++)
{
	var _offset = 2;
	var _txt = menu_menu[_i];
	var _col = c_white;
	if (menu_cursor == _i)
	{
		_txt = string_insert("> ", _txt, 0);
	}
	else
	{
		_col = c_gray;	
	}
	var _xx = menu_x;
	var _yy = menu_y - (menu_itemheight * (_i * 1.5));
	draw_set_color(c_black);
	draw_text(_xx-_offset,_yy,_txt);
	draw_text(_xx+_offset,_yy,_txt);
	draw_text(_xx,_yy+_offset,_txt);
	draw_text(_xx,_yy-_offset,_txt);
	draw_set_color(_col);
	draw_text(_xx,_yy,_txt);
}

draw_set_color(c_black);
draw_rectangle(menu_gui_width, menu_gui_height - 250, menu_gui_width + 900, menu_gui_height, false);