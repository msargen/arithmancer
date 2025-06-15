/// @description save current data to a savestate using an index
/// @arg _index the savestate index being saved to (1, 2, or 3)
function scr_save_to_savestate(_index){
	// room name
	savestate[_index].level = room;
	
	// camera position
	savestate[_index].camera.x_position = obj_camera.x;
	savestate[_index].camera.y_position = obj_camera.y;
	
	// player position
	savestate[_index].player.x_position = obj_player.x;
	savestate[_index].player.y_position = obj_player.y;
}


/// @description load data from a savestate using an index
/// @arg _index the savestate index being loaded from (1, 2, or 3)
function scr_load_from_savestate(_index)
{ /* TEMPORARY WITH UNTIL JSON IS CONFIGURED*/ with (obj_savestate_data) {
	// load json
	// this will use the index
	// variables can be placed into a struct with no indices for ease of use
	
	
	// camera position
	obj_camera.x = savestate[_index].camera.x_position
	obj_camera.y = savestate[_index].camera.y_position
	
	// player position
	obj_player.x = savestate[_index].player.x_position
	obj_player.y = savestate[_index].player.y_position
}}