/// @description launches next level given a level input string
/// @arg _last_level input string of last completed level
function scr_level_mapping(_last_level)
{
	switch (_last_level)
	{
		case "new_game": scr_slide_transition(TRANS_MODE.GOTO, rm_lvl_one); break;
		case "rm_lvl_one": scr_slide_transition(TRANS_MODE.GOTO, rm_lvl_two); break;
		case "rm_lvl_two": scr_slide_transition(TRANS_MODE.GOTO, rm_lvl_three); break;
		case "rm_lvl_three": scr_slide_transition(TRANS_MODE.GOTO, rm_lvl_one); break;
	}
}