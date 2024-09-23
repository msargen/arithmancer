/// @description Size variables and mode setup

transition_width = display_get_gui_width();
transition_height = display_get_gui_height();
transition_height_half = transition_height * 0.5;
enum TRANS_MODE
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}
transition_mode = TRANS_MODE.INTRO;
transition_percent = 1;
transition_target = room;
