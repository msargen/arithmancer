/// @description Check for showing dialogue box

//Proximity
if ((instance_exists(obj_player)) && (point_in_circle(obj_player.x, obj_player.y, x, y, global.interact_distance)) && (!instance_exists(obj_dialogue_box)))
{
	mentor_player_nearby = true;
	if (global.key_interact)
	{
		if (mentor_dialogue_tracker == MENTOR_DIALOGUE.INTRO)
		{
			scr_display_dialogue(mentor_dialogue_map.intro);
			mentor_dialogue_tracker++;
		}
		else if (mentor_dialogue_tracker < MENTOR_DIALOGUE.AHH)
		{
			scr_display_dialogue(mentor_dialogue_map.loop);
			mentor_dialogue_tracker++;
		}
		else
		{
		  scr_display_dialogue(mentor_dialogue_map.ahh);
		}
	}
}
else mentor_player_nearby = false;