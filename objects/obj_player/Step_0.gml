#region //Get player input

if (player_has_control)
{
	player_key_left = global.key_hold_left;
	player_key_right = global.key_hold_right;
	player_key_jump = global.key_jump;
}
else
{
	player_key_right = 0;
	player_key_left = 0;
	player_key_jump = 0;
}

#endregion

#region //Calculate Horizontal Movement
player_wall_jump_delay = max(player_wall_jump_delay - 1, 0);
if (player_wall_jump_delay == 0)
{
	var _dir = player_key_right - player_key_left;
	player_horizontal_speed += _dir * player_horizontal_speed_acc;
	if (_dir == 0)
	{
		var _horizontal_speed_fric_final = player_horizontal_speed_fric_ground;
		if (!player_on_ground) _horizontal_speed_fric_final = player_horizontal_speed_fric_air;
		player_horizontal_speed = scr_approach(player_horizontal_speed, 0, _horizontal_speed_fric_final);
	}
	player_horizontal_speed = clamp(player_horizontal_speed, -player_horizontal_speed_walk, player_horizontal_speed_walk);
}
//Wall Jump
if (player_on_wall != 0) && (!player_on_ground) && (player_key_jump)
{
	player_wall_jump_delay = player_wall_jump_delay_max;
	
	player_horizontal_speed = -player_on_wall * player_horizontal_speed_wall_jump;
	player_vertical_speed = player_vertical_speed_wall_jump;
	
	player_horizontal_speed_frac = 0;
	player_vertical_speed_frac = 0;
}

#endregion

#region //Calculate Vertical Movement
var _grv_final = player_gravity;
var _vertical_speed_max_final = player_vertical_speed_max;
if ((player_on_wall != 0) && (player_vertical_speed > 0))
{
	_grv_final = player_gravity_wall;
	_vertical_speed_max_final = player_vertical_speed_max_wall
}
player_vertical_speed += _grv_final;
player_vertical_speed = clamp(player_vertical_speed, -_vertical_speed_max_final, _vertical_speed_max_final);

//Ground Jumping
if (player_jump_buffer > 0)
{
	player_jump_buffer--;
	if(player_key_jump)
	{
		player_jump_buffer = 0;
		player_vertical_speed = player_vertical_speed_jump;
		player_vertical_speed_frac = 0;
	}
}
player_vertical_speed = clamp(player_vertical_speed, -player_vertical_speed_max, player_vertical_speed_max);

#endregion

#region //Dump fractions and get final integer speeds
player_horizontal_speed += player_horizontal_speed_frac;
player_vertical_speed += player_vertical_speed_frac;
player_horizontal_speed_frac = frac(player_horizontal_speed);
player_vertical_speed_frac = frac(player_vertical_speed);
player_horizontal_speed -= player_horizontal_speed_frac;
player_vertical_speed -= player_vertical_speed_frac

#endregion

#region //Horizontal Collision
if (place_meeting(x+player_horizontal_speed, y, obj_wall))
{
	var _onepixel = sign(player_horizontal_speed);
	while (!place_meeting(x + _onepixel, y, obj_wall)) x += _onepixel;
	player_horizontal_speed = 0;
	player_horizontal_speed_frac = 0;
}
//Horizontal Move
x += player_horizontal_speed;

#endregion

#region //Vertical Collision
if (place_meeting(x, y + player_vertical_speed, obj_wall))
{
	var _onepixel = sign(player_vertical_speed);
	while (!place_meeting(x, y + _onepixel, obj_wall)) y += _onepixel;
	player_vertical_speed = 0;
	player_vertical_speed_frac = 0;
}
//Veritcal Move
y += player_vertical_speed;

#endregion

#region //Calculate Current Status
player_on_ground = place_meeting(x, y + 1, obj_wall);
player_on_wall = place_meeting(x + 1, y, obj_wall) - place_meeting(x - 1, y, obj_wall);
if (player_on_ground) player_jump_buffer = 6;

#endregion

#region //Animations
if (!place_meeting(x, y + 1, obj_wall))
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
	if(global.key_up)
	{
		player_held_gem = player_closest_gem;
		player_holding_gem = true;
		global.key_up = false;
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
	if(global.key_down)
	{
		player_held_gem = 0;
		player_holding_gem = false;
	}
}

// attempt to socket a gem
if(player_holding_gem && player_near_socket && (global.key_up))
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
		global.flags_collected++
	}
	else
	{
		// stun player for incorrect attempt
		scr_stun_player(player_closest_socket);
	}
}