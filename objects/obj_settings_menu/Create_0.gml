/// @description Initialize Settings Menu

//Set visual priority
depth = -1500;

// variables
in_settings_menu = false;
main_volume = 70;
music_volume = 70;
sfx_volume = 70;
adjusted_music_volume = 0.5;
adjusted_sfx_volume = 0.5;
is_fullscreen = 0;
resolution = 720;

// UI adjustments based on display and font size
settings_menu_font_size = font_get_size(fnt_menu);
settings_menu_menu_y_offset = floor(display_get_gui_height()/10.0);
settings_menu_menu_x_offset = floor(display_get_gui_width()/10.0);

// menu options
settings_menu_option[0] = "Main Volume: ";
settings_menu_option[1] = "Music Volume: ";
settings_menu_option[2] = "Sound Effects: ";
settings_menu_option[3] = "";
settings_menu_option[4] = "Fullscreen: ";
settings_menu_option[5] = "Resolution: ";
settings_menu_option[6] = "";
settings_menu_option[7] = "Exit Settings";

settings_menu_cursor_position = 0;

// strings for menu option values
settings_menu_value[0] = "70%";
settings_menu_value[1] = "70%";
settings_menu_value[2] = "70%";
settings_menu_value[3] = "";
settings_menu_value[4] = "No";
settings_menu_value[5] = "720p";
settings_menu_value[6] = "";
settings_menu_value[7] = "";