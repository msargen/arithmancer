/// @description checks for a lack of walls in line of sight between the calling object and the object in the function
/// @arg _target_object the object toward which line of sight is being checked

function line_of_sight(_target_object)
{
	// checks for walls on the collision line between the two objects
	return (collision_line(x, y, _target_object.x, _target_object.y, obj_wall, false, true) == noone)

}
