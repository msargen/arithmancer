/// @description 
if (stunned_done == 0)
{
	stunned_vertical_speed = stunned_vertical_speed + stunned_gravity;

	//horizontal collision
	if (place_meeting(x + stunned_horizontal_speed, y, obj_wall))
	{
		while (!place_meeting(x + sign(stunned_horizontal_speed), y, obj_wall))
		{
			x = x + sign(stunned_horizontal_speed);
		}
		stunned_horizontal_speed = -stunned_horizontal_speed;
	}
	x = x + stunned_horizontal_speed;

	//vertical collision
	if (place_meeting(x, y + stunned_vertical_speed, obj_wall))
	{
		if (stunned_vertical_speed > 0)
		{
			stunned_done = 1;
			image_index = 1;
		}
		while (!place_meeting(x, y + sign(stunned_vertical_speed), obj_wall))
		{
			y = y + sign(stunned_vertical_speed);
		}
		stunned_vertical_speed = 0;
	}
	y = y + stunned_vertical_speed;
}

stunned_timer --;
if stunned_timer == 0
{
	instance_change(obj_player, true)
}