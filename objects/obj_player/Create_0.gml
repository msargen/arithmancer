depth = -200;

player_horizontal_speed = 0;
player_vertical_speed = 0;
player_horizontal_speed_frac = 0;
player_vertical_speed_frac = 0;

player_horizontal_speed_acc = 1;
player_horizontal_speed_fric_ground = 0.50;
player_horizontal_speed_fric_air = 0.15;
player_horizontal_speed_walk = 2;
player_horizontal_speed_wall_jump = 3;

player_vertical_speed_jump = -5.5;
player_vertical_speed_max = 6;
player_vertical_speed_wall_jump = -5.5;
player_vertical_speed_max_wall = 1;

player_on_ground = false;
player_on_wall = 0;

player_dust = 0;

player_jump_buffer = 0;

player_has_control = true;

player_gravity = 0.4;
player_gravity_wall = 0.1;

player_wall_jump_delay = 0;
player_wall_jump_delay_max = 5;

player_key_right = 0;
player_key_left = 0;
player_key_jump = 0;

closest_gem = 0;
near_gem = false;
holding_gem = false;
held_gem = 0;
held_gem_x_target = 0;
held_gem_y_target = 0;
gem_float_offset = 17;

closest_socket = 0;
near_socket = false;