/// @description Draw Settings Menu

if (global.in_settings_menu)
{
	// draw blue background
	draw_set_color(c_blue);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
	
	// general font formatting
	draw_set_font(fnt_menu);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var _font_size = font_get_size(fnt_menu);
	var _shadow_offset = floor(_font_size/10.0);
	var _menu_y_offset = floor(display_get_gui_height()/10.0);
	
	// loop through drawing the array of menu options
	for (var _i = 0; _i < array_length(settings_menu_option); _i++)
	{
		// set display text
		var _menu_x_offset = floor(display_get_gui_width()/10.0);
		var _display_text = settings_menu_option[_i] + settings_menu_value[_i];
		var _menu_entry_color = c_grey;
		
		// hightlight selected menu option
		if (global.settings_menu_cursor_position == _i)
		{
			_menu_entry_color = c_white;
			_menu_x_offset = _menu_x_offset - _font_size;
			_display_text = "> " + settings_menu_option[_i] + settings_menu_value[_i] + " <";
		}
		
		// draw a drop shadow
		draw_set_color(c_black);
		draw_text(_menu_x_offset - _shadow_offset, _menu_y_offset + _i*_font_size*1.5, _display_text);
		draw_text(_menu_x_offset + _shadow_offset, _menu_y_offset + _i*_font_size*1.5, _display_text);
		draw_text(_menu_x_offset, _menu_y_offset - _shadow_offset + _i*_font_size*1.5, _display_text);
		draw_text(_menu_x_offset, _menu_y_offset + _shadow_offset + _i*_font_size*1.5, _display_text);
		
		// draw menu option
		draw_set_color(_menu_entry_color);
		draw_text(_menu_x_offset, _menu_y_offset + _i*_font_size*1.5, _display_text);
	}
}