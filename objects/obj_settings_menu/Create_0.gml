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
sm_safe_buttons = true;
sm_addition_difficulty = EQUATION_DIFFICULTY.EASY;
sm_subtraction_difficulty = EQUATION_DIFFICULTY.EASY;
sm_multiplication_difficulty = EQUATION_DIFFICULTY.EASY;
sm_division_difficulty = EQUATION_DIFFICULTY.EASY;

// UI adjustments based on display and font size
settings_menu_font_size = font_get_size(fnt_menu);
settings_menu_menu_y_offset = floor(display_get_gui_height()/10.0);
settings_menu_menu_x_offset = floor(display_get_gui_width()/10.0);

// menu options
settings_menu_option[SETTINGS_MENU.MAIN_VOLUME] = "Main Volume: ";
settings_menu_option[SETTINGS_MENU.MUSIC_VOLUME] = "Music Volume: ";
settings_menu_option[SETTINGS_MENU.SFX_VOLUME] = "Sound Effects: ";
settings_menu_option[SETTINGS_MENU.EMPTY_1] = "";
settings_menu_option[SETTINGS_MENU.FULLSCREEN] = "Fullscreen: ";
settings_menu_option[SETTINGS_MENU.RESOLUTION] = "Resolution: ";
settings_menu_option[SETTINGS_MENU.EMPTY_2] = "";
settings_menu_option[SETTINGS_MENU.SAFE_BUTTON] = "Use safe buttons: ";
settings_menu_option[SETTINGS_MENU.ADDITION_DIFFICULTY] = "Addition difficulty: ";
settings_menu_option[SETTINGS_MENU.SUBTRACTION_DIFFICULTY] = "Subtraction difficulty: ";
settings_menu_option[SETTINGS_MENU.MULTIPLICATION_DIFFICULTY] = "Multiplication difficulty: ";
settings_menu_option[SETTINGS_MENU.DIVISION_DIFFICULTY] = "Division difficulty: "
settings_menu_option[SETTINGS_MENU.EMPTY_3] = "";
settings_menu_option[SETTINGS_MENU.CONTROLLER] = "Controller: ";
settings_menu_option[SETTINGS_MENU.EMPTY_4] = "";
settings_menu_option[SETTINGS_MENU.EXIT_SETTINGS] = "Exit Settings";

settings_menu_cursor_position = 0;
settings_menu_total_items = array_length(settings_menu_option) - 1;

// strings for menu option values
settings_menu_value[SETTINGS_MENU.MAIN_VOLUME] = "70%";
settings_menu_value[SETTINGS_MENU.MUSIC_VOLUME] = "70%";
settings_menu_value[SETTINGS_MENU.SFX_VOLUME] = "70%";
settings_menu_value[SETTINGS_MENU.EMPTY_1] = "";
settings_menu_value[SETTINGS_MENU.FULLSCREEN] = "No";
settings_menu_value[SETTINGS_MENU.RESOLUTION] = "720p";
settings_menu_value[SETTINGS_MENU.EMPTY_2] = "";
settings_menu_value[SETTINGS_MENU.SAFE_BUTTON] = "False";
settings_menu_value[SETTINGS_MENU.ADDITION_DIFFICULTY] = "Easy";
settings_menu_value[SETTINGS_MENU.SUBTRACTION_DIFFICULTY] = "Easy";
settings_menu_value[SETTINGS_MENU.MULTIPLICATION_DIFFICULTY] = "Easy";
settings_menu_value[SETTINGS_MENU.DIVISION_DIFFICULTY] = "Easy";
settings_menu_value[SETTINGS_MENU.EMPTY_3] = "";
settings_menu_value[SETTINGS_MENU.CONTROLLER] = "none";
settings_menu_value[SETTINGS_MENU.EMPTY_4] = "";
settings_menu_value[SETTINGS_MENU.EXIT_SETTINGS] = "";

// Difficulty options
sm_difficulty_option[EQUATION_DIFFICULTY.OFF] = "Off";
sm_difficulty_option[EQUATION_DIFFICULTY.EASY] = "Easy";
sm_difficulty_option[EQUATION_DIFFICULTY.MEDUIM] = "Medium";
sm_difficulty_option[EQUATION_DIFFICULTY.HARD] = "Hard";
