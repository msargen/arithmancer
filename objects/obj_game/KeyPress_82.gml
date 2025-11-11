/// @description Restart the room
// TODO: remove
if (scr_room_is_level(room))
{
	call_cancel(global.level_time_source);
}
room_restart();