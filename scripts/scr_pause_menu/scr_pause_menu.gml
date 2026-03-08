/// @description This function draws the pause menu when the game is paused
function scr_pause_menu_draw(){	
	// How much space to leave between the text and the edge of the box
	var _pause_text_padding_h = 8;
	var _pause_text_padding_v = 8;
	
	// Vertical calculations
	var _pause_menu_height = array_length(pause_menu_option) * font_get_size(global.menu_font);
	var _pause_box_height = _pause_menu_height + 2 * _pause_text_padding_v;
	var _pause_box_y = floor((RES_H - _pause_box_height) / 2) - 1;
	
	// Horizontal calculations
	var _pause_menu_width = scr_widest_string(pause_menu_option);
	var _pause_menu_marker = string_width("> ");
	var _pause_box_width = _pause_menu_width + 2 * (_pause_text_padding_h + _pause_menu_marker);
	var _pause_box_x = floor((RES_W - _pause_box_width) / 2) - 1;
	
	// Draw black menu box
	scr_draw_set_text(c_black, global.menu_font, fa_left, fa_top);
	draw_roundrect(_pause_box_x, _pause_box_y, _pause_box_x + _pause_box_width, _pause_box_y + _pause_box_height, false);
	
	// Loop through drawing the array of pause menu options
	for (var _i = 0; _i < array_length(pause_menu_option); _i++)
	{
		// Set display text
		var _display_text = pause_menu_option[_i];
		var _menu_entry_color = c_red;
		var _text_x_position = _pause_box_x + _pause_text_padding_h + _pause_menu_marker +1;
		
		// Hightlight selected menu option
		if (pause_menu_cursor_position == _i)
		{
			_menu_entry_color = c_white;
			_text_x_position = _pause_box_x + _pause_text_padding_h + 1;
			_display_text = "> " + pause_menu_option[_i] + " <";
		}
	
		// Draw menu option
		draw_set_color(_menu_entry_color);
		var _text_y_position = _pause_box_y + _pause_text_padding_v + _i * font_get_size(global.menu_font) + 2;
		draw_text(_text_x_position, _text_y_position, _display_text);
	}
}


/// @description This function unpauses and activates objects 
function scr_unpause(){
	pause_is_paused = false;
	pause_in_menu = false;
	pause_menu_cursor_position = 0;
	instance_activate_all();
	if (surface_exists(pause_surface)) surface_free(pause_surface);
	if (buffer_exists(pause_surface_buffer)) buffer_delete(pause_surface_buffer);
}