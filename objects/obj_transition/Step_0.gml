/// @description Progress the transition

if (transition_mode != TRANS_MODE.OFF)
{
	if (transition_mode == TRANS_MODE.INTRO)
	{
		transition_percent = max(0, transition_percent - max((transition_percent / 10), 0.005));
	}
	else
	{
		transition_percent = min(1.2, transition_percent + max(((1.2 - transition_percent) / 10), 0.005));
	}

	if (transition_percent == 1.2) || (transition_percent == 0)
	{
		switch (transition_mode)
		{
			case TRANS_MODE.INTRO:
			{
				transition_mode = TRANS_MODE.OFF;
				break;
			}
			case TRANS_MODE.NEXT:
			{
				transition_mode = TRANS_MODE.INTRO;
				room_goto_next();
				break;
			}
			case TRANS_MODE.GOTO:
			{
				transition_mode = TRANS_MODE.INTRO;
				room_goto(transition_target);
				break;
			}
			case TRANS_MODE.RESTART:
			{
				game_restart();
				break;
			}
			
		}
	}
}
