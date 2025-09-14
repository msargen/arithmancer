/// @description Select Answer and stop player when colliding with answer bubble

var _creation_flag = other.bubble_creation_flag_id;

//Does not allow bubble to trigger immediatly
if(other.bubble_timer < other.bubble_timer_max)
{
	return;
}
if(other.bubble_val == _creation_flag.bubble_flag_equation_solution)
{
	//For correct bubble stop upward motion, remove equation flag and increment flags collected
	player_vertical_speed = 0;
	
	for(var _i = 0; _i < array_length(_creation_flag.bubble_object_ids); _i++)
	{
		instance_destroy(_creation_flag.bubble_object_ids[_i]);
	}
	instance_destroy(_creation_flag);
	global.equations_solved++ ;
}
else
{
	scr_stun_player();
}
