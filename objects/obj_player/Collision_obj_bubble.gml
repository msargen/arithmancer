/// @description Select Answer and stop player when colliding with answer bubble

var _closest_flag = instance_nearest(x, y, obj_bubble_flag);
//Does not allow bubble to trigger immediatly
if(other.bubble_timer < other.bubble_timer_max)
{
	return;
}
if(other.bubble_val == _closest_flag.bubble_flag_equation_solution)
{
	//For correct bubble stop upward motion, remove equation flag and increment flags collected
	player_vertical_speed = 0;
	instance_destroy(other);
	instance_destroy(_closest_flag);
	instance_destroy(instance_nearest(x, y, obj_bubble));
	global.equations_solved++ ;
}
else
{
	scr_stun_player();
}
