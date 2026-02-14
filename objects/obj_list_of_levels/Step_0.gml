/// @description Navigate list

// Move up
if (global.key_up)
{
	lol_cursor --;
	lol_text_vertical -= lol_line_height;
}

// Loop back to the bottom when reaching the top
if (lol_cursor < 0)
{
	lol_cursor = lol_list_count-1;
	lol_text_vertical += lol_list_count * lol_line_height;
}

// Move down
if (global.key_down)
{
	lol_cursor ++;
	lol_text_vertical += lol_line_height;
}

// Loop back to the top when reaching the bottom
if (lol_cursor == lol_list_count)
{
	lol_cursor = 0;
	lol_text_vertical -= lol_list_count * lol_line_height;
}

// Slide the text when moving up and down
if (abs(lol_text_vertical - RES_H / 2) > 1)
{
	lol_text_vertical -= (lol_text_vertical - RES_H / 2) / 5
}

// Select
if (global.key_select)
{
	// Transition to selected room
	scr_slide_transition(TRANS_MODE.GOTO, lol_list[lol_cursor]);
}

// Go back
if (global.key_back)
{
	// Return to main menu
	scr_slide_transition(TRANS_MODE.GOTO, rm_main_menu);
}