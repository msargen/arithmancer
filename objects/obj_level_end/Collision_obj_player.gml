/// @description Move to next room

with (obj_player)
{
	if (player_has_control)
	{
		player_has_control = false;
		scr_slide_transition(TRANS_MODE.GOTO, other.level_end_target);
	}
		
}