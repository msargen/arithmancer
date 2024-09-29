/// @description Teleport
if (place_meeting(x, y + 1, obj_wall) && (place_empty(x, y - 20)))
{
	x = x;
	y = y - 20;
}

