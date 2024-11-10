/// @description Control Settings Menu

if (in_settings_menu)
{
	// move up
	if ((keyboard_check_pressed(vk_up)) || keyboard_check_pressed(ord("W")))
	{
		if (settings_menu_cursor_position > 0)
		{
			settings_menu_cursor_position --;
			// skip past empty spots
			switch (settings_menu_cursor_position)
			{
				case SETTINGS_MENU.EMPTY_1:
				case SETTINGS_MENU.EMPTY_2:
					settings_menu_cursor_position --;
					break;
			}
		}
	}
	
	// move down
	if ((keyboard_check_pressed(vk_down)) || keyboard_check_pressed(ord("S")))
	{
		if (settings_menu_cursor_position < (array_length(settings_menu_option) - 1))
		{
			settings_menu_cursor_position ++;
			// skip past empty spots
			switch (settings_menu_cursor_position)
			{
				case SETTINGS_MENU.EMPTY_1:
				case SETTINGS_MENU.EMPTY_2:
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
			if (((keyboard_check_pressed(vk_left)) || keyboard_check_pressed(ord("A"))) && (main_volume > 0))
			{
				// adjust volume level down
				scr_main_volume_adjustment(-10);
			}
			if (((keyboard_check_pressed(vk_right)) || keyboard_check_pressed(ord("D"))) && (main_volume < 100))
			{
				// adjust volume level up
				scr_main_volume_adjustment(10);
			}
			break;
		
		// music volume
		case SETTINGS_MENU.MUSIC_VOLUME:
			if (((keyboard_check_pressed(vk_left)) || keyboard_check_pressed(ord("A"))) && (music_volume > 0))
			{
				// adjust volume level down
				scr_music_volume_adjustment(-10);
			}
			if (((keyboard_check_pressed(vk_right)) || keyboard_check_pressed(ord("D"))) && (music_volume < 100))
			{
				// adjust volume level up
				scr_music_volume_adjustment(10);
			}
			break;
		
		// sfx volume
		case SETTINGS_MENU.SFX_VOLUME:
			if (((keyboard_check_pressed(vk_left)) || keyboard_check_pressed(ord("A"))) && (sfx_volume > 0))
			{
				// adjust volume level down
				scr_sfx_volume_adjustment(-10);
			}
			if (((keyboard_check_pressed(vk_right)) || keyboard_check_pressed(ord("D"))) && (sfx_volume < 100))
			{
				// adjust volume level up
				scr_sfx_volume_adjustment(10);
			}
			break;
		
		// fullscreen toggle
		case SETTINGS_MENU.FULLSCREEN:
			if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")))
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
			if (((keyboard_check_pressed(vk_left)) || keyboard_check_pressed(ord("A"))) && (resolution > 361))
			{
				// adjust resolution down
				resolution = resolution - RES_H;
				settings_menu_value[5] = string(resolution) + "p"
				window_set_size(resolution * 16/9, resolution);
			}
			if (((keyboard_check_pressed(vk_right)) || keyboard_check_pressed(ord("D"))) && (resolution < 2159))
			{
				// adjust resolution up
				resolution = resolution + RES_H;
				settings_menu_value[5] = string(resolution) + "p"
				window_set_size(resolution * 16/9, resolution);
			}
			break;
		
		// exit menu
		case SETTINGS_MENU.EXIT_SETTINGS:
			if (keyboard_check_pressed(vk_enter))
			{
				in_settings_menu = false;
				scr_save_settings_to_file();
				
				if(obj_pause.pause_is_paused){obj_pause.pause_in_menu = true;};
			}
			break;
	}
}