/// @description TDB

if (instance_exists(obj_auto_scroll) && player_on_screen)
{
	player_on_screen = false;
	// Check if the player is still off-screen in two seconds
	alarm[1] = game_get_speed(gamespeed_fps) * 2;
}