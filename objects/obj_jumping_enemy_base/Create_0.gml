/// @description Initialize Jumping Enemy

jumping_enemy_horizontal_speed = 2;
jumping_enemy_vertical_speed = 0;

// default speeds set to match player
jumping_enemy_gravity = 0.4;
jumping_enemy_max_fall_speed = 6;
jumping_enemy_jump_speed = -5;

jumping_enemy_is_grounded = false;

// times are in parts of a second
jumping_enemy_timer = 0;
jumping_enemy_slow_idle_time = global.framerate * (0.5);
jumping_enemy_fast_idle_time = global.framerate * (1.0);
jumping_enemy_crouch_time = global.framerate * (1.25);

jumping_enemy_chase_player = false;