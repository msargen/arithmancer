// Start background music when first loading game
if (obj_game.game_previous_room == rm_loading_screen)
{
	audio_play_sound(snd_menu_ending, 1001, true);
}

// Load symbols preference from ini after game has had a chance to let controller connect
// If the symbols preference is loaded too early, it will be overridden by connecting controller(s)
ini_open("settings.ini");
obj_settings_menu.sm_symbols = ini_read_real("Controls", "Symbols", SYMBOLS.KEYBOARD);
ini_close();
scr_settings_symbol_value_update(obj_settings_menu.sm_symbols);