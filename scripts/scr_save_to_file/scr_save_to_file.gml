function scr_save_settings_to_file()
{
	with(obj_settings_menu)
	{
		ini_open("settings.ini");
		ini_write_real("Volume", "Main", main_volume);
		ini_write_real("Volume", "Music", music_volume);
		ini_write_real("Volume", "SFX", sfx_volume);
		ini_close();
	}
}