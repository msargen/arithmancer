/// @description Initialize Settings Menu

in_settings_menu = false;

main_volume = 70;  // we can change these to pull from a file at load
music_volume = 70;
sfx_volume = 70;

// set music and sfx volume
adjusted_music_volume = main_volume * music_volume / 10000;
adjusted_sfx_volume = main_volume * sfx_volume / 10000;
audio_group_set_gain(audiogroup_music, adjusted_music_volume, 0);
audio_group_set_gain(audiogroup_sfx, adjusted_sfx_volume, 0);

// menu options
settings_menu_option[0] = "Main Volume: ";
settings_menu_option[1] = "Music Volume: ";
settings_menu_option[2] = "Sound Effects: ";
settings_menu_option[3] = ""
settings_menu_option[4] = "Display: "
settings_menu_option[5] = "Other setting: "
settings_menu_option[6] = ""
settings_menu_option[7] = "Exit Settings";

settings_menu_cursor_position = 0;

// strings for menu option values
settings_menu_value[0] = "00" + string(main_volume) + "%";
settings_menu_value[0] = string_delete(settings_menu_value[0], 1, (string_length(string(main_volume))-1));
settings_menu_value[1] = "00" + string(music_volume) + "%";
settings_menu_value[1] = string_delete(settings_menu_value[1], 1, (string_length(string(music_volume))-1));
settings_menu_value[2] = "00" + string(sfx_volume) + "%";
settings_menu_value[2] = string_delete(settings_menu_value[2], 1, (string_length(string(sfx_volume))-1));
settings_menu_value[3] = "";
settings_menu_value[4] = "4k 120fps";
settings_menu_value[5] = "value";
settings_menu_value[6] = "";
settings_menu_value[7] = "";