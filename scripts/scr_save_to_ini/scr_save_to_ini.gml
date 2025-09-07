/// @description commit settings menu values to ini file
function scr_save_settings_to_file()
{
	with(obj_settings_menu)
	{
		ini_open("settings.ini");
		ini_write_real("Volume", "Main", main_volume);
		ini_write_real("Volume", "Music", music_volume);
		ini_write_real("Volume", "SFX", sfx_volume);
		ini_write_real("Display", "Fullscreen", is_fullscreen);
		ini_write_real("Display", "Resolution", resolution);
		ini_write_real("Difficulty", "Easy_buttons", sm_easy_buttons);
		ini_write_real("Difficulty", "Addition_difficulty", sm_addition_difficulty);
		ini_write_real("Difficulty", "Subtraction_difficulty", sm_subtraction_difficulty);
		ini_write_real("Difficulty", "Multiplication_difficulty", sm_multiplication_difficulty);
		ini_write_real("Difficulty", "Division_difficulty", sm_division_difficulty);
		ini_close();
	}
}


/// @description update most recently completed level in ini file
/// @arg _level_name the name of the most recently completed level
function scr_save_level_completion_to_file(_level_name)
{
	ini_open("settings.ini");
	ini_write_string("Level", "Last Completed", _level_name);
	ini_close();
}