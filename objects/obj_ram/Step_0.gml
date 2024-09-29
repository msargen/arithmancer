ram_vertical_speed = ram_vertical_speed + ram_gravity;

// Don't wald off edges
if (ram_is_grounded) && (!place_meeting(x + ram_horizontal_speed, y + 1, obj_wall))
{
	ram_horizontal_speed = -ram_horizontal_speed;
}

//Horizontal collision
if (place_meeting(x + ram_horizontal_speed, y, obj_wall))
{
	while (!place_meeting(x + sign(ram_horizontal_speed), y, obj_wall))
	{
		x = x + sign(ram_horizontal_speed);
	}
	ram_horizontal_speed = -ram_horizontal_speed;
}
x = x + ram_horizontal_speed;

//Vertical collision
if (place_meeting(x, y + ram_vertical_speed, obj_wall))
{
	while (!place_meeting(x, y + sign(ram_vertical_speed), obj_wall))
	{
		y = y + sign(ram_vertical_speed);
	}
	ram_vertical_speed = 0;
}
y = y + ram_vertical_speed;

//Animations
if (!place_meeting(x, y + 1, obj_wall))
{
	ram_is_grounded = false;
	sprite_index = spr_ram;
	image_speed = 0;
	if (sign(ram_vertical_speed) > 0) image_index = 1; else image_index = 0;
}
else
{
	ram_is_grounded = true;
	image_speed = 1;
	if (ram_horizontal_speed == 0)
	{
		sprite_index = spr_ram;
	}
	else
	{
		sprite_index = spr_ram_running;
	}
}

if (ram_horizontal_speed != 0) image_xscale = sign(ram_horizontal_speed);

