// Check if jumping enemy is on solid ground
jumping_enemy_is_grounded = place_meeting(x, y + 1, obj_wall)

// Loop through idle animation, crouch, and jump
if (jumping_enemy_is_grounded)
{
	// Advance jump timer
	jumping_enemy_timer ++;
	
	// Slow idle animation
	if (jumping_enemy_timer < jumping_enemy_slow_idle_time)
	{
		// Swap between first two images of sprite every 8 frames
		image_index = floor(jumping_enemy_timer / 8.0) % 2;
	}
	// Fast idle animation
	else if (jumping_enemy_timer < jumping_enemy_fast_idle_time)
	{
		// Swap between first two images of sprite every 4 frames
		image_index = floor(jumping_enemy_timer / 4.0) % 2;
	}
	// Crouching
	else if (jumping_enemy_timer < jumping_enemy_crouch_time)
	{
		// Stay on crouch image
		image_index = 2;
	}
	// Jumping
	else
	{
		// Check for line of sight on player
		// Collision == -4 means that no instance of obj_wall was detected in line of sight
		if (instance_exists(obj_player) && jumping_enemy_chase_player && (collision_line(x, y, obj_player.x, obj_player.y, obj_wall, false, true) == -4))
		{
			// Orient next jump towards player
			jumping_enemy_horizontal_speed = sign(obj_player.x - x) * abs(jumping_enemy_horizontal_speed);
		}
		
		// Jump
		jumping_enemy_vertical_speed = jumping_enemy_jump_speed;
		jumping_enemy_is_grounded = false;
	}
}

 // In the air
 if (!jumping_enemy_is_grounded)
{
	// Reset jump timer and set sprite to the in air sprite
	jumping_enemy_timer = 0;
	image_index = 3;
	
	// Add gravity if travelling less than terminal velocity
	if (jumping_enemy_vertical_speed < jumping_enemy_max_fall_speed)
	{
		jumping_enemy_vertical_speed += jumping_enemy_gravity;
	}
	
	// Reverse direction at horizontal collision
	if (place_meeting(x + jumping_enemy_horizontal_speed, y, obj_wall))
	{
		// Advance towards collision 1 pixel at a time until hitting
		while (!place_meeting(x + sign(jumping_enemy_horizontal_speed), y, obj_wall))
		{
			x += sign(jumping_enemy_horizontal_speed);
		}
		// Reverse speed and image facing
		jumping_enemy_horizontal_speed = -jumping_enemy_horizontal_speed;
	}
	
	// Vertical collision
	if (place_meeting(x, y + jumping_enemy_vertical_speed, obj_wall))
	{
		// Advance towards collision 1 pixel at a time until hitting
		while (!place_meeting(x, y + sign(jumping_enemy_vertical_speed), obj_wall))
		{
			y += sign(jumping_enemy_vertical_speed);
		}
		// Stop falling 
		jumping_enemy_vertical_speed = 0;
	}
	
	// Movement only happens in the air
	x += jumping_enemy_horizontal_speed;
	y += jumping_enemy_vertical_speed;
}