/// @description This function draws the pause menu when the game is paused
function scr_pause_menu_draw(){
	//draw black menu box
	scr_draw_set_text(c_black, fnt_menu, fa_left, fa_top);
		var _pause_gui_x = display_get_gui_width() * 0.3;
		var _pause_gui_y = display_get_gui_height() * 0.3;
		var _pause_gui_x_width = display_get_gui_width() * 0.4;
		var _pause_gui_y_height = display_get_gui_height() * 0.4; 
		var _pause_menu_font_size = font_get_size(fnt_menu);
	draw_roundrect(_pause_gui_x, _pause_gui_y, _pause_gui_x + _pause_gui_x_width, _pause_gui_y + _pause_gui_y_height, false);
	
	// loop through drawing the array of pause menu options
	for (var _i = 0; _i < array_length(pause_menu_option); _i++)
	{
		// set display text
		var _display_text = pause_menu_option[_i];
		var _menu_entry_color = c_red;
		var _text_x_position = display_get_gui_width() * .35;
		
		// hightlight selected menu option
		if (pause_menu_cursor_position == _i)
		{
			_menu_entry_color = c_white;
			_text_x_position = display_get_gui_width() * .35 - _pause_menu_font_size * global.text_scale;
			_display_text = "> " + pause_menu_option[_i] + " <";
		}
	
		// draw menu option
		draw_set_color(_menu_entry_color);
		var _text_y_position = display_get_gui_height() * .35 + _i * _pause_menu_font_size * 1.5 *global.text_scale;
		draw_text_transformed(_text_x_position, _text_y_position, _display_text, global.text_scale, global.text_scale, 0);
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