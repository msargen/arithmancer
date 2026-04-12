//Create Pause Variable
pause_is_paused = false;
pause_surface = -1;
pause_surface_buffer = -1;
pause_in_menu = false; 

//Pause Menu Options
pause_menu_option[PAUSE_MENU.SETTINGS] = "Settings";
pause_menu_option[PAUSE_MENU.MAIN_MENU] = "Return to Main Menu";
pause_menu_option[PAUSE_MENU.QUIT] = "Quit to Desktop";
pause_menu_option[PAUSE_MENU.UNPAUSE] = "Unpause";
//pause_menu_option[4] = "Summon Exodia"

//initialize cursor position
pause_menu_cursor_position = PAUSE_MENU.SETTINGS;