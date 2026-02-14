/// @description Move Cursor in Menu

if(!pause_in_menu){exit;}

// move up
if (global.key_up)
{
	if (pause_menu_cursor_position > 0)
	{
		pause_menu_cursor_position --;
	}
}
	
// move down
if (global.key_down)
{
	if (pause_menu_cursor_position < (array_length(pause_menu_option) - 1))
	{
		pause_menu_cursor_position ++;
	}
}

if (global.key_select)
{
	switch(pause_menu_cursor_position)
	{
		//Move to Settings Menu from Pause Menu
		case 0:
			obj_settings_menu.settings_menu_cursor_position = 0;
			pause_in_menu = false;
			obj_settings_menu.in_settings_menu = true;
			break;
		//Return to Main Menu
		case 1:
			scr_unpause();
			call_cancel(global.level_time_source);
			scr_slide_transition(TRANS_MODE.GOTO, rm_main_menu);
			break;
		//Exit Game to Desktop
		case 2:
			game_end();
			break;
		//Unpause game
		case 3:
			scr_unpause();
			break;	
	}
}
