/// @description Control Settings Menu

// Set keybindings
scr_keybind();

if (in_settings_menu)
{
	// Move up
	if (global.key_up)
	{
		settings_menu_cursor_position--;
		// Skip past empty spots
		switch (settings_menu_cursor_position)
		{
			case SETTINGS_MENU.EMPTY_1:
			case SETTINGS_MENU.EMPTY_2:
			case SETTINGS_MENU.EMPTY_3:
			case SETTINGS_MENU.EMPTY_4:
				settings_menu_cursor_position--;
				break;
		}
		
		// Loop to other end of settings options
		if (settings_menu_cursor_position < 0)
		{
			settings_menu_cursor_position = settings_menu_total_items;
		}
	}
	
	// Move down
	if (global.key_down)
	{
		settings_menu_cursor_position++;
		// Skip past empty spots
		switch (settings_menu_cursor_position)
		{
			case SETTINGS_MENU.EMPTY_1:
			case SETTINGS_MENU.EMPTY_2:
			case SETTINGS_MENU.EMPTY_3:
			case SETTINGS_MENU.EMPTY_4:
				settings_menu_cursor_position++;
				break;
		}
		
		// Loop to other end of settings options
		if (settings_menu_cursor_position > settings_menu_total_items)
		{
			settings_menu_cursor_position = 0;
		}
	}
	
	// Move back one screen
	if (global.key_back)
	{
		// Sets back and pause to false so you can move from Settings to Pause Menu
		global.key_back = false;
		global.key_pause = false;
		in_settings_menu = false;
		scr_save_settings_to_file();
				
		if(obj_pause.pause_is_paused){obj_pause.pause_in_menu = true;};
	}
	
	// Switch for the settings menu options
	switch (settings_menu_cursor_position)
	{
		// Main volume
		case SETTINGS_MENU.MAIN_VOLUME:
			if (global.key_left && (main_volume > 0))
			{
				// Adjust volume level down
				scr_main_volume_adjustment(-10);
			}
			if (global.key_right && (main_volume < 100))
			{
				// Adjust volume level up
				scr_main_volume_adjustment(10);
			}
			break;
		
		// Music volume
		case SETTINGS_MENU.MUSIC_VOLUME:
			if (global.key_left && (music_volume > 0))
			{
				// Adjust volume level down
				scr_music_volume_adjustment(-10);
			}
			if (global.key_right && (music_volume < 100))
			{
				// Adjust volume level up
				scr_music_volume_adjustment(10);
			}
			break;
		
		// Sfx volume
		case SETTINGS_MENU.SFX_VOLUME:
			if (global.key_left && (sfx_volume > 0))
			{
				// Adjust volume level down
				scr_sfx_volume_adjustment(-10);
			}
			if (global.key_right && (sfx_volume < 100))
			{
				// Adjust volume level up
				scr_sfx_volume_adjustment(10);
			}
			break;
		
		// Fullscreen toggle
		case SETTINGS_MENU.FULLSCREEN:
			if (global.key_left || global.key_right)
			{
				if (bool(is_fullscreen))
				{
					// Toggle fullscreen off
					settings_menu_value[SETTINGS_MENU.FULLSCREEN] = "False";
					is_fullscreen = 0;
					window_set_fullscreen(false);
					window_set_size(resolution * 16/9, resolution);
				}
				else
				{
					// Toggle fullscreen on
					settings_menu_value[SETTINGS_MENU.FULLSCREEN] = "True";
					is_fullscreen = 1;
					window_set_fullscreen(true);
				}
			}
			break;
		
		// Display resolution
		case SETTINGS_MENU.RESOLUTION:
			if (global.key_left && (resolution > 361)) //360p, the lowest resolution at 2X base of 180X320
			{
				// Adjust resolution down
				resolution = resolution - RES_H;
				settings_menu_value[SETTINGS_MENU.RESOLUTION] = string(resolution) + "p"
				window_set_size(resolution * 16/9, resolution);
			}
			if (global.key_right && (resolution < 2159)) //4k, the highest resolution for people who want windowed 4k for some reason?
			{
				// Adjust resolution up
				resolution = resolution + RES_H;
				settings_menu_value[SETTINGS_MENU.RESOLUTION] = string(resolution) + "p"
				window_set_size(resolution * 16/9, resolution);
			}
			break;
			
		// Safe button toggle
		case SETTINGS_MENU.SAFE_BUTTON:
			if (global.key_left || global.key_right)
			{
				if (sm_safe_buttons)
				{
					// Toggle safe button mode off
					settings_menu_value[SETTINGS_MENU.SAFE_BUTTON] = "False";
					sm_safe_buttons = false;
				}
				else
				{
					// Toggle safe button mode on
					settings_menu_value[SETTINGS_MENU.SAFE_BUTTON] = "True";
					sm_safe_buttons = true;
				}
			}
			break;
			
		// Adjust difficulty for addition problems
		case SETTINGS_MENU.ADDITION_DIFFICULTY:
			if (global.key_left && sm_addition_difficulty > EQUATION_DIFFICULTY.OFF)
			{
				sm_addition_difficulty--;
			}
			if (global.key_right && sm_addition_difficulty < EQUATION_DIFFICULTY.HARD)
			{
				sm_addition_difficulty++;
			}
			
			settings_menu_value[SETTINGS_MENU.ADDITION_DIFFICULTY] = sm_difficulty_option[sm_addition_difficulty];
			scr_set_addition_difficulty(sm_addition_difficulty);
			break;
			
		// Adjust difficulty for subtraction problems
		case SETTINGS_MENU.SUBTRACTION_DIFFICULTY:
			if (global.key_left && sm_subtraction_difficulty > EQUATION_DIFFICULTY.OFF)
			{
				sm_subtraction_difficulty--;
			}
			if (global.key_right && sm_subtraction_difficulty < EQUATION_DIFFICULTY.HARD)
			{
				sm_subtraction_difficulty++;
			}
			
			settings_menu_value[SETTINGS_MENU.SUBTRACTION_DIFFICULTY] = sm_difficulty_option[sm_subtraction_difficulty];
			scr_set_subtraction_difficulty(sm_subtraction_difficulty);
			break;
			
		// Adjust difficulty for multiplication problems
		case SETTINGS_MENU.MULTIPLICATION_DIFFICULTY:
			if (global.key_left && sm_multiplication_difficulty > EQUATION_DIFFICULTY.OFF)
			{
				sm_multiplication_difficulty--;
			}
			if (global.key_right && sm_multiplication_difficulty < EQUATION_DIFFICULTY.HARD)
			{
				sm_multiplication_difficulty++;
			}
			
			settings_menu_value[SETTINGS_MENU.MULTIPLICATION_DIFFICULTY] = sm_difficulty_option[sm_multiplication_difficulty];
			scr_set_multiplication_difficulty(sm_multiplication_difficulty);
			break;
			
		// Adjust difficulty for division problems
		case SETTINGS_MENU.DIVISION_DIFFICULTY:
			if (global.key_left && sm_division_difficulty > EQUATION_DIFFICULTY.OFF)
			{
				sm_division_difficulty--;
			}
			if (global.key_right && sm_division_difficulty < EQUATION_DIFFICULTY.HARD)
			{
				sm_division_difficulty++;
			}
			
			settings_menu_value[SETTINGS_MENU.DIVISION_DIFFICULTY] = sm_difficulty_option[sm_division_difficulty];
			scr_set_division_difficulty(sm_division_difficulty);
			break;
		
		// Controller choice
		case SETTINGS_MENU.CONTROLLER:
			if (global.key_left && (obj_controller.controller_selected != 0)) 
			{
				// Switch to an earlier controller in the list
				obj_controller.controller_selected--;
				// Loop back to end of list if needed
				if (obj_controller.controller_selected < 1) {obj_controller.controller_selected = obj_controller.controller_total_number;};
				// Update settings menu
				scr_settings_menu_controller_update(obj_controller.controller_port_list[obj_controller.controller_selected]);
			}
			if (global.key_right && (obj_controller.controller_selected != 0)) 
			{
				// Switch to the next controller in the list
				obj_controller.controller_selected++;
				// Loop back to beginning of list if needed
				if (obj_controller.controller_selected > obj_controller.controller_total_number) {obj_controller.controller_selected = 1;};
				// Update settings menu
				scr_settings_menu_controller_update(obj_controller.controller_port_list[obj_controller.controller_selected]);
			}
			break;
		
		// Displayed symbols choice
		case SETTINGS_MENU.SYMBOLS:
			if (global.key_left) 
			{
				// Switch to an earlier symbol option
				sm_symbols--;
				// Loop back around
				if (sm_symbols < SYMBOLS.KEYBOARD) {sm_symbols =SYMBOLS.XBOX;};
				// Update value
				scr_settings_symbol_value_update(sm_symbols);
			}
			if (global.key_right) 
			{
				// Switch to a later symbol option
				sm_symbols++;
				// Loop back around
				if (sm_symbols > SYMBOLS.XBOX) {sm_symbols =SYMBOLS.KEYBOARD;};
				// Update value
				scr_settings_symbol_value_update(sm_symbols);
			}
			break;
		
		// Exit menu
		case SETTINGS_MENU.EXIT_SETTINGS:
			if (global.key_select)
			{
				global.key_select = false;
				in_settings_menu = false;
				scr_save_settings_to_file();
				
				if(obj_pause.pause_is_paused){obj_pause.pause_in_menu = true;};
			}
			break;
	}
	
}
