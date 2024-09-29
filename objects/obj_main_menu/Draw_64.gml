/// @description Draw Menu

draw_set_font(fnt_menu);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

for (var _i = 0; _i < main_menu_items; _i++)
{
	var _offset = 2;
	var _txt = main_menu_options[_i];
	var _col = c_white;
	if (main_menu_cursor == _i)
	{
		_txt = string_insert("> ", _txt, 0);
	}
	else
	{
		_col = c_gray;	
	}
	var _xx = main_menu_x;
	var _yy = main_menu_y - (main_menu_item_height * (_i * 1.5));
	draw_set_color(c_black);
	draw_text(_xx-_offset,_yy,_txt);
	draw_text(_xx+_offset,_yy,_txt);
	draw_text(_xx,_yy+_offset,_txt);
	draw_text(_xx,_yy-_offset,_txt);
	draw_set_color(_col);
	draw_text(_xx,_yy,_txt);
}

draw_set_color(c_black);
draw_rectangle(main_menu_gui_width, main_menu_gui_height - 250, main_menu_gui_width + 900, main_menu_gui_height, false);