/// @description Respawn the player if they fall off the map

if (y > room_height)
{
	// Sets the alarm to go off after a tenth of a second
	alarm[0] = game_get_speed(gamespeed_fps) * 0.1;
}