/// @description Respawn the player if they fall off the map

// TODO: this doesn't work if the player exits the room horizontally. They could fall off of the map and never be reset. Does that need to be fixed.
if (y > room_height)
{
	// Sets the alarm to go off after a tenth of a second
	alarm[0] = game_get_speed(gamespeed_fps) * 0.1;
}