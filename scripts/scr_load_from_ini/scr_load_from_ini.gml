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
		
		// Load difficulty options
		sm_safe_buttons = ini_read_real("Difficulty", "Safe_buttons", true);
		sm_addition_difficulty = ini_read_real("Difficulty", "Addition_difficulty", EQUATION_DIFFICULTY.EASY);
		sm_subtraction_difficulty = ini_read_real("Difficulty", "Subtraction_difficulty", EQUATION_DIFFICULTY.EASY);
		sm_multiplication_difficulty = ini_read_real("Difficulty", "Multiplication_difficulty", EQUATION_DIFFICULTY.EASY);
		sm_division_difficulty = ini_read_real("Difficulty", "Division_difficulty", EQUATION_DIFFICULTY.EASY);
		
		// Set difficulty options
		scr_set_addition_difficulty(sm_addition_difficulty);
		scr_set_subtraction_difficulty(sm_subtraction_difficulty);
		scr_set_multiplication_difficulty(sm_multiplication_difficulty);
		scr_set_division_difficulty(sm_division_difficulty);
		
		// convert to padded strings
		settings_menu_value[SETTINGS_MENU.MAIN_VOLUME] = "00" + string(main_volume) + "%";
		settings_menu_value[SETTINGS_MENU.MAIN_VOLUME] = string_delete(settings_menu_value[SETTINGS_MENU.MAIN_VOLUME], 1, (string_length(string(main_volume))-1));
		settings_menu_value[SETTINGS_MENU.MUSIC_VOLUME] = "00" + string(music_volume) + "%";
		settings_menu_value[SETTINGS_MENU.MUSIC_VOLUME] = string_delete(settings_menu_value[SETTINGS_MENU.MUSIC_VOLUME], 1, (string_length(string(music_volume))-1));
		settings_menu_value[SETTINGS_MENU.SFX_VOLUME] = "00" + string(sfx_volume) + "%";
		settings_menu_value[SETTINGS_MENU.SFX_VOLUME] = string_delete(settings_menu_value[SETTINGS_MENU.SFX_VOLUME], 1, (string_length(string(sfx_volume))-1));
		settings_menu_value[SETTINGS_MENU.FULLSCREEN] = bool(is_fullscreen) ? "True" : "False";
		settings_menu_value[SETTINGS_MENU.RESOLUTION] = string(resolution) + "p";
		settings_menu_value[SETTINGS_MENU.SAFE_BUTTON] = sm_safe_buttons ? "True" : "False";
		settings_menu_value[SETTINGS_MENU.ADDITION_DIFFICULTY] = sm_difficulty_option[sm_addition_difficulty];
		settings_menu_value[SETTINGS_MENU.SUBTRACTION_DIFFICULTY] = sm_difficulty_option[sm_subtraction_difficulty];
		settings_menu_value[SETTINGS_MENU.MULTIPLICATION_DIFFICULTY] = sm_difficulty_option[sm_multiplication_difficulty];
		settings_menu_value[SETTINGS_MENU.DIVISION_DIFFICULTY] = sm_difficulty_option[sm_division_difficulty];
	}
	
	ini_close();
}