//Horizontal collision
if (place_meeting(x + flying_object_base_horizontal_speed, y, obj_wall))
{
	while (!place_meeting(x + sign(flying_object_base_horizontal_speed), y, obj_wall))
	{
		x = x + sign(flying_object_base_horizontal_speed);
	}
	flying_object_base_horizontal_speed = -flying_object_base_horizontal_speed;
}
x = x + flying_object_base_horizontal_speed;

//Vertical collision
if (place_meeting(x, y + flying_object_base_vertical_speed, obj_wall))
{
	while (!place_meeting(x, y + sign(flying_object_base_vertical_speed), obj_wall))
	{
		y = y + sign(flying_object_base_vertical_speed);
	}
	flying_object_base_vertical_speed = -flying_object_base_vertical_speed;
}
y = y + flying_object_base_vertical_speed;


// TODO: move the player with the platform (also push both rams and players to the side for horizontal collizion)
// What happens if the block tries to move the player but the player can't move? (already against a wall?)
