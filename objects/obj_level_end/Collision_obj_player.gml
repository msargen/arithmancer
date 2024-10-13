/// @description Move to next room

with (obj_player)
{
	if (player_has_control)
	{
		player_has_control = false;
		scr_save_level_completion_to_file(room_get_name(room));
		scr_slide_transition(TRANS_MODE.GOTO, other.level_end_target);
	}
		
}