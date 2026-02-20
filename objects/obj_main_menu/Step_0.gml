/// @description Control Menu
//Item ease in
main_menu_x += (main_menu_x_target - main_menu_x) / main_menu_speed;

//Keyboard Controls
if (!obj_settings_menu.in_settings_menu)
{
	// Move up
	if (global.key_up)
	{
		main_menu_cursor++;
		// Loop to the bottom option
		if (main_menu_cursor > main_menu_items)
		{
			main_menu_cursor = 0;
		}
	}
	
	// Move down
	if (global.key_down)
	{
		main_menu_cursor--;
		// Loop to the top option
		if (main_menu_cursor < 0) {main_menu_cursor = main_menu_items;}
	}
	
	// Select an option
	if (global.key_select)
	{
		switch (main_menu_cursor)
		{
		// Level list (dev mode only)
		case MAIN_MENU.LEVEL_LIST:
			scr_slide_transition(TRANS_MODE.GOTO, rm_list_of_levels);
			break;
		
		// Continue
		case MAIN_MENU.QUICK_PLAY:
			ini_open("settings.ini");
			var _last_level = ini_read_string("Level", "Last Completed", "new_game");
			ini_close();
			scr_level_mapping(_last_level);
			break;
		
		// World select
		case MAIN_MENU.WORLD_SELECT:
			scr_slide_transition(TRANS_MODE.GOTO, rm_world_select);
			break;
		
		// Settings
		case MAIN_MENU.SETTINGS:
			obj_settings_menu.settings_menu_cursor_position = 0;
			obj_settings_menu.in_settings_menu = true;
			break;
		
		// Quit game
		case MAIN_MENU.QUIT:
			game_end();
			break;
		}
	}
	
	if (global.key_back)
	{
		// Return to title screen
		scr_slide_transition(TRANS_MODE.GOTO, rm_title_screen);
	}
}