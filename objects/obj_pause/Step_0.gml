/// @description Move Cursor in Menu
if(!pause_in_menu){exit;}

// move up
if ((keyboard_check_pressed(vk_up)) || keyboard_check_pressed(ord("W")))
{
	if (pause_menu_cursor_position > 0)
	{
		pause_menu_cursor_position --;
	}
}
	
// move down
if ((keyboard_check_pressed(vk_down)) || keyboard_check_pressed(ord("S")))
{
	if (pause_menu_cursor_position < (array_length(pause_menu_option) - 1))
	{
		pause_menu_cursor_position ++;
	}
}

if (keyboard_check_pressed(vk_enter))
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
			scr_slide_transition(TRANS_MODE.GOTO, rm_menu);
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