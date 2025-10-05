/// @description TDB

if (instance_exists(obj_auto_scroll) && player_should_check_position)
{
	player_should_check_position = false;
	// Check if the player is still off-screen in two seconds
	alarm[1] = game_get_speed(gamespeed_fps) * 2;
}