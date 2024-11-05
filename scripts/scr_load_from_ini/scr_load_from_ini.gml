/// @description load all values from settings.ini
function scr_load_from_ini() {
	ini_open("settings.ini");
	
	with (obj_settings_menu)
	{
		// load volume values
		main_volume = ini_read_real("Volume", "Main", 70);
		music_volume = ini_read_real("Volume", "Music", 70);
		sfx_volume = ini_read_real("Volume", "SFX", 70);
		
		// set music and sfx volume
		adjusted_music_volume = main_volume * music_volume / 10000;
		adjusted_sfx_volume = main_volume * sfx_volume / 10000;
		audio_group_set_gain(audiogroup_music, adjusted_music_volume, 0);
		audio_group_set_gain(audiogroup_sfx, adjusted_sfx_volume, 0);
		
		// load display values
		is_fullscreen = ini_read_real("Display", "Fullscreen", 0);
		resolution = ini_read_real("Display", "Resolution", 720);
		
		// set display values
		window_set_size(resolution * 16/9, resolution);
		window_set_fullscreen(bool(is_fullscreen));
		
		// convert to padded strings
		settings_menu_value[0] = "00" + string(main_volume) + "%";
		settings_menu_value[0] = string_delete(settings_menu_value[0], 1, (string_length(string(main_volume))-1));
		settings_menu_value[1] = "00" + string(music_volume) + "%";
		settings_menu_value[1] = string_delete(settings_menu_value[1], 1, (string_length(string(music_volume))-1));
		settings_menu_value[2] = "00" + string(sfx_volume) + "%";
		settings_menu_value[2] = string_delete(settings_menu_value[2], 1, (string_length(string(sfx_volume))-1));
		if (bool(is_fullscreen)) {settings_menu_value[4] = "True";};
		if (!bool(is_fullscreen)) {settings_menu_value[4] = "False";};
		settings_menu_value[5] = string(resolution) + "p";
	}
	
	ini_close();
}