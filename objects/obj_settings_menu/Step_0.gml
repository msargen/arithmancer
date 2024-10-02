/// @description Control Settings Menu

if (global.in_settings_menu)
{
	// move up
	if ((keyboard_check_pressed(vk_up)) || keyboard_check_pressed(ord("W")))
	{
		if (global.settings_menu_cursor_position > 0)
		{
			global.settings_menu_cursor_position --;
			// skip past empty spots
			switch (global.settings_menu_cursor_position)
			{
				case 3:
				case 6:
					global.settings_menu_cursor_position --;
					break;
			}
		}
	}
	
	// move down
	if ((keyboard_check_pressed(vk_down)) || keyboard_check_pressed(ord("S")))
	{
		if (global.settings_menu_cursor_position < (array_length(settings_menu_option) - 1))
		{
			global.settings_menu_cursor_position ++;
			// skip past empty spots
			switch (global.settings_menu_cursor_position)
			{
				case 3:
				case 6:
					global.settings_menu_cursor_position ++;
					break;
			}
		}
	}
	
	// switch for the settings menu options
	switch (global.settings_menu_cursor_position)
	{
		// main volume
		case 0:
			if (((keyboard_check_pressed(vk_left)) || keyboard_check_pressed(ord("A"))) && (main_volume > 0))
			{
				// adjust volume level
				main_volume -= 10;
				// update display text
				settings_menu_value[0] = "00" + string(main_volume) + "%";
				settings_menu_value[0] = string_delete(settings_menu_value[0], 1, (string_length(string(main_volume))-1));
				// set adjusted volume levels
				adjusted_music_volume = main_volume * music_volume / 10000;
				adjusted_sfx_volume = main_volume * sfx_volume / 10000;
				audio_group_set_gain(audiogroup1, adjusted_music_volume, 0);
				audio_group_set_gain(audiogroup2, adjusted_sfx_volume, 0);
				// play sound effect at new volume
				audio_play_sound(snd_landing, 4, false);
			}
			if (((keyboard_check_pressed(vk_right)) || keyboard_check_pressed(ord("D"))) && (main_volume < 100))
			{
				// adjust volume level
				main_volume += 10;
				// update display text
				settings_menu_value[0] = "00" + string(main_volume) + "%";
				settings_menu_value[0] = string_delete(settings_menu_value[0], 1, (string_length(string(main_volume))-1));
				// set adjusted volume levels
				adjusted_music_volume = main_volume * music_volume / 10000;
				adjusted_sfx_volume = main_volume * sfx_volume / 10000;
				audio_group_set_gain(audiogroup1, adjusted_music_volume, 0);
				audio_group_set_gain(audiogroup2, adjusted_sfx_volume, 0);
				// play sound effect at new volume
				audio_play_sound(snd_landing, 4, false);
			}
			break;
		
		// music volume
		case 1:
			if (((keyboard_check_pressed(vk_left)) || keyboard_check_pressed(ord("A"))) && (music_volume > 0))
			{
				// adjust volume level
				music_volume -= 10;
				// update display text
				settings_menu_value[1] = "00" + string(music_volume) + "%";
				settings_menu_value[1] = string_delete(settings_menu_value[1], 1, (string_length(string(music_volume))-1));
				// set adjusted volume levels
				adjusted_music_volume = main_volume * music_volume / 10000;
				audio_group_set_gain(audiogroup1, adjusted_music_volume, 0);
			}
			if (((keyboard_check_pressed(vk_right)) || keyboard_check_pressed(ord("D"))) && (music_volume < 100))
			{
				// adjust volume level
				music_volume += 10;
				// update display text
				settings_menu_value[1] = "00" + string(music_volume) + "%";
				settings_menu_value[1] = string_delete(settings_menu_value[1], 1, (string_length(string(music_volume))-1));
				// set adjusted volume levels
				adjusted_music_volume = main_volume * music_volume / 10000;
				audio_group_set_gain(audiogroup1, adjusted_music_volume, 0);
			}
			break;
		
		// sfx volume
		case 2:
			if (((keyboard_check_pressed(vk_left)) || keyboard_check_pressed(ord("A"))) && (sfx_volume > 0))
			{
				// adjust volume level
				sfx_volume -= 10;
				// update display text
				settings_menu_value[2] = "00" + string(sfx_volume) + "%";
				settings_menu_value[2] = string_delete(settings_menu_value[2], 1, (string_length(string(sfx_volume))-1));
				// set adjusted volume levels
				adjusted_sfx_volume = main_volume * sfx_volume / 10000;
				audio_group_set_gain(audiogroup2, adjusted_sfx_volume, 0);
				// play sound effect at new volume
				audio_play_sound(snd_landing, 4, false);
			}
			if (((keyboard_check_pressed(vk_right)) || keyboard_check_pressed(ord("D"))) && (sfx_volume < 100))
			{
				// adjust volume level
				sfx_volume += 10;
				// update display text
				settings_menu_value[2] = "00" + string(sfx_volume) + "%";
				settings_menu_value[2] = string_delete(settings_menu_value[2], 1, (string_length(string(sfx_volume))-1));
				// set adjusted volume levels
				adjusted_sfx_volume = main_volume * sfx_volume / 10000;
				audio_group_set_gain(audiogroup2, adjusted_sfx_volume, 0);
				// play sound effect at new volume
				audio_play_sound(snd_landing, 4, false);
			}
			break;
		
		// exit menu
		case 7:
			if (keyboard_check_pressed(vk_enter))
			{
				global.in_settings_menu = false;
				var _room = room_get_name(room);
				if ((_room != "rm_menu") && (_room != "rm_ending"))
				{
					global.player_has_control = true;
				}
			}
			break;
	}
}