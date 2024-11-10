/// @description Draw Settings Menu

if (in_settings_menu)
{
	// draw blue background
	scr_draw_set_text(c_blue, fnt_menu, fa_left, fa_top);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
	
	// loop through drawing the array of menu options
	for (var _i = 0; _i < array_length(settings_menu_option); _i++)
	{
		// set display text
		var _display_text = settings_menu_option[_i] + settings_menu_value[_i];
		var _menu_entry_color = c_grey;
		var _text_x_position = settings_menu_menu_x_offset;
		
		// hightlight selected menu option
		if (settings_menu_cursor_position == _i)
		{
			_menu_entry_color = c_white;
			_text_x_position = settings_menu_menu_x_offset - settings_menu_font_size * global.text_scale;
			_display_text = "> " + settings_menu_option[_i] + settings_menu_value[_i] + " <";
		}
	
		// draw menu option
		var _text_y_position = settings_menu_menu_y_offset + _i * settings_menu_font_size * 1.5 * global.text_scale;
		scr_draw_text_outline(_text_x_position, _text_y_position, _menu_entry_color, c_black, global.text_offset, _display_text, global.text_scale);
	}
}