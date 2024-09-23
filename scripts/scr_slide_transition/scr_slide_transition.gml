/// @description scr_slide_transition(mode, targetroom)
/// @arg Mode sets transition mode between next, restart, and goto.
/// @arg Target sets target room when using the goto mode.
function scr_slide_transition() {

	with (obj_transition)
	{
		transition_mode = argument[0];
		if (argument_count > 1) transition_target = argument[1];
	}
}
