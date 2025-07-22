/// @description actions to perform at room creation
/// @arg _savestate_index flag to indicate whether to load room defaults (0) or a savestate (1-3)
function scr_room_creation(_savestate_index)
{
	// function to increment timer and update global.time for display
	function _time_update()
	{
		with (obj_game)
		{
			game_timer ++
			
			game_timer_seconds = game_timer mod 60;
			game_timer_minutes = floor(game_timer/60);
			
			// populate global.time with padding and then trim
			global.time = string(game_timer_minutes) + ":0" + string(game_timer_seconds);
			global.time = string_delete(global.time, string_length(string(game_timer_minutes))+2, (string_length(string(game_timer_seconds))-1));
		}
	}
	
	// start timer at 0 and call _time_update function 1/second
	obj_game.game_timer = 0;
	global.time = "0:00";
	global.level_time_source = call_later(1, time_source_units_seconds, _time_update, true);
	
	// reset collected flags
	global.equations_solved = 0;
	
	// load from savestate if flagged to do so
	if (_savestate_index != 0)
	{
		scr_load_from_savestate(_savestate_index);
		obj_savestate_data.savestate_load_number = 0;
	}
}