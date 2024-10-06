/// @description adjust main volume value
/// @arg _volume_up the amount the volume changes, positive or negative
function scr_main_volume_adjustment(_volume_up)
{
	with(obj_settings_menu)
	{
		// adjust volume level
		main_volume += _volume_up;
		// update display text
		settings_menu_value[0] = "00" + string(main_volume) + "%";
		settings_menu_value[0] = string_delete(settings_menu_value[0], 1, (string_length(string(main_volume))-1));
		// update adjusted volume levels
		scr_update_adjusted_volume_levels();
	}

}


/// @description adjust music volume value
/// @arg _volume_up the amount the volume changes, positive or negative
function scr_music_volume_adjustment(_volume_up)
{
	with(obj_settings_menu)
	{
		// adjust volume level
		music_volume += _volume_up;
		// update display text
		settings_menu_value[1] = "00" + string(music_volume) + "%";
		settings_menu_value[1] = string_delete(settings_menu_value[1], 1, (string_length(string(music_volume))-1));
		// update adjusted volume levels
		scr_update_adjusted_volume_levels();
	}
}


/// @description adjust sfx volume value
/// @arg _volume_up the amount the volume changes, positive or negative
function scr_sfx_volume_adjustment(_volume_up)
{
	with(obj_settings_menu)
	{
		// adjust volume level
		sfx_volume += _volume_up;
		// update display text
		settings_menu_value[2] = "00" + string(sfx_volume) + "%";
		settings_menu_value[2] = string_delete(settings_menu_value[2], 1, (string_length(string(sfx_volume))-1));
		// update adjusted volume levels
		scr_update_adjusted_volume_levels();
	}
}


/// @description update the volume levels based on values of main_volume, music_volume, and sfx_volume
function scr_update_adjusted_volume_levels()
{
	with(obj_settings_menu)
	{
		// update adjusted volume levels
		adjusted_music_volume = main_volume * music_volume / 10000;
		adjusted_sfx_volume = main_volume * sfx_volume / 10000;
		audio_group_set_gain(audiogroup_music, adjusted_music_volume, 0);
		audio_group_set_gain(audiogroup_sfx, adjusted_sfx_volume, 0);
		// play sound effect at new volume
		audio_play_sound(snd_landing, 4, false);
	}
}