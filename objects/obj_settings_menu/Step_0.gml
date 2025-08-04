/// @description Control Settings Menu

//set keybindings
keybind();

if (in_settings_menu)
{
	// move up
	if (global.key_up)
	{
		if (settings_menu_cursor_position > 0)
		{
			settings_menu_cursor_position --;
			// skip past empty spots
			switch (settings_menu_cursor_position)
			{
				case SETTINGS_MENU.EMPTY_1:
				case SETTINGS_MENU.EMPTY_2:
				case SETTINGS_MENU.EMPTY_3:
				case SETTINGS_MENU.EMPTY_4:
					settings_menu_cursor_position --;
					break;
			}
		}
	}
	
	// move down
	if (global.key_down)
	{
		if (settings_menu_cursor_position < (array_length(settings_menu_option) - 1))
		{
			settings_menu_cursor_position ++;
			// skip past empty spots
			switch (settings_menu_cursor_position)
			{
				case SETTINGS_MENU.EMPTY_1:
				case SETTINGS_MENU.EMPTY_2:
				case SETTINGS_MENU.EMPTY_3:
				case SETTINGS_MENU.EMPTY_4:
					settings_menu_cursor_position ++;
					break;
			}
		}
	}
	
	// switch for the settings menu options
	switch (settings_menu_cursor_position)
	{
		// main volume
		case SETTINGS_MENU.MAIN_VOLUME:
			if (global.key_left && (main_volume > 0))
			{
				// adjust volume level down
				scr_main_volume_adjustment(-10);
			}
			if (global.key_right && (main_volume < 100))
			{
				// adjust volume level up
				scr_main_volume_adjustment(10);
			}
			break;
		
		// music volume
		case SETTINGS_MENU.MUSIC_VOLUME:
			if (global.key_left && (music_volume > 0))
			{
				// adjust volume level down
				scr_music_volume_adjustment(-10);
			}
			if (global.key_right && (music_volume < 100))
			{
				// adjust volume level up
				scr_music_volume_adjustment(10);
			}
			break;
		
		// sfx volume
		case SETTINGS_MENU.SFX_VOLUME:
			if (global.key_left && (sfx_volume > 0))
			{
				// adjust volume level down
				scr_sfx_volume_adjustment(-10);
			}
			if (global.key_right && (sfx_volume < 100))
			{
				// adjust volume level up
				scr_sfx_volume_adjustment(10);
			}
			break;
		
		// fullscreen toggle
		case SETTINGS_MENU.FULLSCREEN:
			if (global.key_left || global.key_right)
			{
				if (bool(is_fullscreen))
				{
					// Toggle fullscreen off
					settings_menu_value[4] = "False";
					is_fullscreen = 0;
					window_set_fullscreen(false);
					window_set_size(resolution * 16/9, resolution);
				}
				else
				{
					// Toggle fullscreen on
					settings_menu_value[4] = "True";
					is_fullscreen = 1;
					window_set_fullscreen(true);
				}
			}
			break;
		
		// display resolution
		case SETTINGS_MENU.RESOLUTION:
			if (global.key_left && (resolution > 361)) //360p, the lowest resolution at 2X base of 180X320
			{
				// adjust resolution down
				resolution = resolution - RES_H;
				settings_menu_value[5] = string(resolution) + "p"
				window_set_size(resolution * 16/9, resolution);
			}
			if (global.key_right && (resolution < 2159)) //4k, the highest resolution for people who want windowed 4k for some reason?
			{
				// adjust resolution up
				resolution = resolution + RES_H;
				settings_menu_value[5] = string(resolution) + "p"
				window_set_size(resolution * 16/9, resolution);
			}
			break;
			
		// Easy button toggle
		case SETTINGS_MENU.EASY_BUTTON:
			if (global.key_left || global.key_right)
			{
				if (sm_easy_buttons)
				{
					// Toggle easy button mode off
					settings_menu_value[7] = "False";
					sm_easy_buttons = false;
				}
				else
				{
					// Toggle easy button mode on
					settings_menu_value[7] = "True";
					sm_easy_buttons = true;
				}
			}
			break;
			
		// Adjust difficulty for addition problems
		case SETTINGS_MENU.ADDITION_DIFFICULTY:
			if (global.key_left && sm_addition_difficulty > 0)
			{
				sm_addition_difficulty--;
			}
			if (global.key_right && sm_addition_difficulty < 3)
			{
				sm_addition_difficulty++;
			}
			
			settings_menu_value[8] = sm_difficulty_option[sm_addition_difficulty];
			scr_set_addition_function(sm_addition_difficulty);
			break;
			
		// Adjust difficulty for subtraction problems
		case SETTINGS_MENU.SUBTRACTION_DIFFICULTY:
			if (global.key_left && sm_subtraction_difficulty > 0)
			{
				sm_subtraction_difficulty--;
			}
			if (global.key_right && sm_subtraction_difficulty < 3)
			{
				sm_subtraction_difficulty++;
			}
			
			settings_menu_value[9] = sm_difficulty_option[sm_subtraction_difficulty];
			scr_set_subtraction_function(sm_subtraction_difficulty);
			break;
			
		// Adjust difficulty for multiplication problems
		case SETTINGS_MENU.MULTIPLICATION_DIFFICULTY:
			if (global.key_left && sm_multiplication_difficulty > 0)
			{
				sm_multiplication_difficulty--;
			}
			if (global.key_right && sm_multiplication_difficulty < 3)
			{
				sm_multiplication_difficulty++;
			}
			
			settings_menu_value[10] = sm_difficulty_option[sm_multiplication_difficulty];
			scr_set_multiplication_function(sm_multiplication_difficulty);
			break;
			
		// Adjust difficulty for division problems
		case SETTINGS_MENU.DIVISION_DIFFICULTY:
			if (global.key_left && sm_division_difficulty > 0)
			{
				sm_division_difficulty--;
			}
			if (global.key_right && sm_division_difficulty < 3)
			{
				sm_division_difficulty++;
			}
			
			settings_menu_value[11] = sm_difficulty_option[sm_division_difficulty];
			scr_set_division_function(sm_division_difficulty);
			break;
		
		// controller choice
		case SETTINGS_MENU.CONTROLLER:
			if (global.key_left && (obj_controller.controller_selected > 1)) 
			{
				// switch to an earlier controller in the list
				obj_controller.controller_selected--;
				scr_settings_menu_controller_update(obj_controller.controller_port_list[obj_controller.controller_selected]);
			}
			if (global.key_right && (obj_controller.controller_selected < obj_controller.controller_total_number)) 
			{
				// switch to the next controller in the list
				obj_controller.controller_selected++;
				scr_settings_menu_controller_update(obj_controller.controller_port_list[obj_controller.controller_selected]);
			}
			break;
		
		// exit menu
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
