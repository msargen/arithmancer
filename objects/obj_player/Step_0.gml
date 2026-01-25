#region //Get player input

if (!player_has_control)
{
	global.key_hold_left = 0;
	global.key_hold_right = 0;
	global.key_jump = 0;
}

#endregion

#region //Calculate Horizontal Movement
// lock player input for a few frames after a wall jump
if (player_wall_jump_delay > 0) {player_wall_jump_delay--;}
if (player_wall_jump_delay == 0)
{
	// accelerate player in direction of pressed key(s)
	var _dir = global.key_hold_right - global.key_hold_left;
	player_horizontal_speed += _dir * player_horizontal_speed_acc;
	// apply friction if no directional input
	if (_dir == 0)
	{
		var _horizontal_speed_fric_final = player_horizontal_speed_fric_ground;
		if (!player_on_ground) _horizontal_speed_fric_final = player_horizontal_speed_fric_air;
		player_horizontal_speed = scr_approach(player_horizontal_speed, 0, _horizontal_speed_fric_final);
	}
	// clamp speed to +/- max speed
	player_horizontal_speed = clamp(player_horizontal_speed, -player_horizontal_speed_max, player_horizontal_speed_max);
}

//Wall Jump
if (player_on_wall != 0) && (!player_on_ground) && (global.key_jump)
{
	// lock player input for a few frames after a wall jump
	player_wall_jump_delay = player_wall_jump_delay_max;
	// launch player upward and away from the wall
	player_horizontal_speed = -player_on_wall * player_horizontal_speed_wall_jump;
	player_vertical_speed = player_vertical_speed_wall_jump;
	player_on_wall = 0;
}

// Prevents the player from moonwalking when pinched in a moving platform
if (player_pinched)
{
	player_horizontal_speed = 0;	
}

#endregion

#region //Calculate Vertical Movement
// if player is sliding down a wall, use wall gravity and speed
if ((player_on_wall != 0) && (player_vertical_speed > 0))
{
	player_gravity_final = player_gravity_wall;
	player_vertical_speed_max_final = player_vertical_speed_max_wall;
}
// otherwise use normal gravity and speed
else
{
	player_gravity_final = player_gravity;
	player_vertical_speed_max_final = player_vertical_speed_max;
}
// apply gravity and clamp speed to appropriate value
if (!player_on_ground)
{
	player_vertical_speed += player_gravity_final;
	player_vertical_speed = clamp(player_vertical_speed, -player_vertical_speed_max_final, player_vertical_speed_max_final);
}

//Ground Jumping
// give the player a few frames of forgiveness to jump when walking off a ledge
if (player_on_ground) {player_jump_buffer = player_jump_buffer_max;}
if (player_jump_buffer > 0)
{
	player_jump_buffer--;
	if(global.key_jump)
	{
		// set buffer to 0 to prevent double jumping
		player_jump_buffer = 0;
		player_vertical_speed = player_vertical_speed_jump;
	}
}

#endregion

#region // Horizontal + Vertical Collision
var _horizontal_collision = place_meeting(player_horizontal_position + player_horizontal_speed, player_vertical_position, obj_wall)
var _vertical_collision = place_meeting(player_horizontal_position, player_vertical_position + player_vertical_speed, obj_wall)
var _diagonal_collision = place_meeting(player_horizontal_position + player_horizontal_speed, player_vertical_position + player_vertical_speed, obj_wall)
if (_horizontal_collision || _vertical_collision || _diagonal_collision)
{
	// iterate through distance until collision, which happens when there is roughly around half a pixel overlap
	// after collision, back off one iteration to ensure no rounding errors
	var _iterations = global.collision_lerp
	for (var _i = 0; _i < _iterations; _i++)
	{
		// horizontal collision
		if (place_meeting(player_horizontal_position + player_horizontal_speed / _iterations, player_vertical_position, obj_wall))
		{
			// Needed to prevent the player getting stuck in corners
			player_horizontal_position -= player_horizontal_speed / _iterations;
			// at horizontal collision, stop horizontal speed and back player away from collision (rouding to the closest whole pixel)
			player_horizontal_position = (sign(player_horizontal_speed) == 1) ? floor(player_horizontal_position) : ceil(player_horizontal_position);
			player_horizontal_speed = 0;
		}
		else
		{
			player_horizontal_position += player_horizontal_speed / _iterations;
		}
		// vertical collision
		if (place_meeting(player_horizontal_position, player_vertical_position + player_vertical_speed / _iterations, obj_wall))
		{
			// at vertical collision, stop vertical speed and back player away from collision (rouding to the closest whole pixel)
			player_vertical_position = (sign(player_vertical_speed) == 1) ? floor(player_vertical_position) : ceil(player_vertical_position);
			player_vertical_speed = 0;
		}
		else
		{
			player_vertical_position += player_vertical_speed / _iterations;
		}
	}
}
else
{
	// move normally
	player_horizontal_position += player_horizontal_speed;
	player_vertical_position += player_vertical_speed;
}

// Prevents the case of visuals getting affected by half pixel positions from air friction and changing direction
player_horizontal_position = round(player_horizontal_position);
player_vertical_position = round(player_vertical_position);

// Set object position to calculated position
x = player_horizontal_position;
y = player_vertical_position;

#endregion

#region //Calculate Current Status
player_on_ground = place_meeting(x, y + 1, obj_wall);
player_on_wall = place_meeting(x + 1, y, obj_wall) - place_meeting(x - 1, y, obj_wall);

// Update the player spawn location (only if they are on the ground and not on a flying object)
if (player_on_ground && !place_meeting(x, y + 1, obj_flying_object_base))
{
	player_x_spawn = x;
	player_y_spawn = y;
}

#endregion

#region //Animations
if (!player_on_ground)
{
	if (player_on_wall != 0)
	{
		sprite_index = spr_player_jumping;
		image_xscale = player_on_wall;
		
		var _side = bbox_left;
		if (player_on_wall == 1) _side = bbox_right;
		player_dust++;
		if ((player_dust > 2) && (player_vertical_speed > 0)) with (instance_create_layer(_side, bbox_top, "Player", obj_dust))
		{
			other.player_dust = 0;
			dust_horizontal_speed = -other.player_on_wall*0.5;
		}
	}
	else
	{
		player_dust = 0;
		sprite_index = spr_player_jumping;
		image_speed = 0;
		if (sign(player_vertical_speed) > 0) image_index = 1; else image_index = 0;
	}
}
else
{
	player_jump_buffer = 10;
	if (sprite_index == spr_player_jumping)
	{
		audio_sound_pitch(snd_landing,choose(0.8, 1.0, 1.2));
		audio_play_sound(snd_landing, 4, false);
		repeat(5)
		{
			with (instance_create_layer(x, bbox_bottom, "Player", obj_dust))
			{
				player_vertical_speed = 0;
			}
		}
	}
	image_speed = 1;
	if (player_horizontal_speed == 0)
	{
		sprite_index = spr_player;
	}
	else
	{
		sprite_index = spr_player_running;
	}
}

if (player_horizontal_speed != 0) image_xscale = sign(player_horizontal_speed);

#endregion


// get information on closest gem and socket
player_closest_gem = instance_nearest(x, y, obj_gem);
if(player_closest_gem) {player_near_gem = point_in_circle(x, y, player_closest_gem.x, player_closest_gem.y, global.interact_distance);}
player_closest_socket = instance_nearest(x, y, obj_gem_socket);
if(player_closest_socket) {player_near_socket = point_in_circle(x, y, player_closest_socket.x, player_closest_socket.y, global.interact_distance) && (player_closest_socket.socket_answer != 0);}

// pick up closest gem if not holding one
if(player_near_gem && !player_holding_gem)
{
	// pick up gem when up button is pressed
	if(global.key_interact)
	{
		player_held_gem = player_closest_gem;
		player_holding_gem = true;
		global.key_interact = false;
	}
}

// move the gem to float above the player
if(player_holding_gem)
{
    // set target as above player head
	player_held_gem_x_target = x;
	player_held_gem_y_target = y - player_gem_float_offset;
	
	// update object position using same smoothing formula as camera
	player_held_gem.x += (player_held_gem_x_target - player_held_gem.x) / 5;
	player_held_gem.y += (player_held_gem_y_target - player_held_gem.y) / 5;
}

// drop a gem if holding one
if(player_holding_gem)
{
	if(global.key_drop)
	{
		player_held_gem = 0;
		player_holding_gem = false;
	}
}

// attempt to socket a gem
if(player_holding_gem && player_near_socket && (global.key_interact))
{
	// check if the right gem is at the right socket
	if(player_closest_socket.socket_answer == player_held_gem.gem_answer)
	{
		// destroy carried gem
		player_holding_gem = false;
		player_near_gem = false;
		instance_destroy(player_held_gem);
		
		// activate socket
		player_closest_socket.socket_answer = global.over_9000;
		player_closest_socket.image_index = 1;
		global.equations_solved++
	}
	else
	{
		// stun player for incorrect attempt
		scr_stun_player(player_closest_socket);
	}
}

// If the player is recovering from a stunned condition. Count down their invincibility timer
if (player_invincible)
{
	
	player_invincible_timer--;
	player_button_stun_delay_timer--;
	
	// Flicker the player until they are no longer invincible
	// The mod 3 sets the flicker to a good pace
	// The minimum opacity is 0.5
	if (player_invincible_timer % 3 == 0)
	{
		if (player_flicker_up)
		{
			image_alpha += 0.1;
		}
		else
		{
			image_alpha -= 0.1;
		}
		
		if (image_alpha == 0.5)
		{
			player_flicker_up = true;
		}
		else if (image_alpha == 0.9)
		{
			player_flicker_up = false;
		}
	
	}
	
	if (player_invincible_timer == 0)
	{
		// End the players invincibility and reset the player opacity to normal
		player_invincible = false;
		player_invincible_timer = player_invincible_timer_base;
		image_alpha = 1;
	}
}
