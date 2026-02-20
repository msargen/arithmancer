/// @description Press Any Key

// Press any key on keyboard or controller to move to the main menu
if (keyboard_check_pressed(vk_anykey) || scr_press_any_controller())
{
	    scr_slide_transition(TRANS_MODE.GOTO, rm_main_menu);
}