// Check if walking enemy is on solid ground
walking_enemy_is_grounded = place_meeting(x, y + 1, obj_wall)

// Check if the walking enemy is about to walk off a ledge, 0.75 chosen as an estimated ratio between hitbox and sprite width
walking_enemy_approaching_ledge = !place_meeting(x + sign(walking_enemy_horizontal_speed) * sprite_get_width(sprite_index) * 0.75, y + 1, obj_wall)

// Don't walk off edges (toggled by walking_enemy_stay_on_platform)
if (walking_enemy_is_grounded && walking_enemy_stay_on_platform && walking_enemy_approaching_ledge)
{
	// Reverse speed and image facing
	walking_enemy_horizontal_speed = -walking_enemy_horizontal_speed;
	image_xscale = sign(walking_enemy_horizontal_speed);
}

// Reverse direction at horizontal collision
if (place_meeting(x + walking_enemy_horizontal_speed, y, obj_wall))
{
	// Advance towards collision 1 pixel at a time until hitting
	while (!place_meeting(x + sign(walking_enemy_horizontal_speed), y, obj_wall))
	{
		x += sign(walking_enemy_horizontal_speed);
	}
	// Reverse speed and image facing
	walking_enemy_horizontal_speed = -walking_enemy_horizontal_speed;
	image_xscale = sign(walking_enemy_horizontal_speed);
}
else
{
	// Normal movement if not reversing
	x += walking_enemy_horizontal_speed;
}

// Falling
if (!walking_enemy_is_grounded)
{
	// Use first frame of sprite while falling
	image_speed = 0;
	image_index = 0;
	
	// Add gravity if travelling less than terminal velocity
	if (walking_enemy_vertical_speed < walking_enemy_max_fall_speed)
	{
		walking_enemy_vertical_speed += walking_enemy_gravity;
	}
	// Vertical collision
	if (place_meeting(x, y + walking_enemy_vertical_speed, obj_wall))
	{
		// Advance towards collision 1 pixel at a time until hitting
		while (!place_meeting(x, y + sign(walking_enemy_vertical_speed), obj_wall))
		{
			y += sign(walking_enemy_vertical_speed);
		}
		// Stop falling 
		walking_enemy_vertical_speed = 0;
	}
	else
	{
		// Normal movement if not stopping
		y += walking_enemy_vertical_speed;
	}
}
else
{
	// Regular animation when not falling
	image_speed = 1;

}

