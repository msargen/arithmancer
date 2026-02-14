/// @description For dev only. Easy restart room
if (global.dev_build)
{
	if (scr_room_is_level(room))
	{
		call_cancel(global.level_time_source);
	}
	room_restart();
}