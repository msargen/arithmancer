/// @description Check whether the current room is a level and return true or false
/// @arg _room The room to check
function scr_room_is_level(_room)
{
	var _string_to_find = "lvl";
	var _position_to_look = 4;
	return (string_pos(_string_to_find, room_get_name(_room)) == _position_to_look)
}