depth = -200;

player_horizontal_speed = 0;
player_vertical_speed = 0;
player_horizontal_position = x;
player_vertical_position = y;

player_horizontal_speed_acc = 1;
player_horizontal_speed_fric_ground = 0.50;
player_horizontal_speed_fric_air = 0.15;
player_horizontal_speed_max = 2;
player_horizontal_speed_wall_jump = 3;

player_vertical_speed_jump = -5.5;
player_vertical_speed_max = 6;
player_vertical_speed_wall_jump = -5.5;
player_vertical_speed_max_wall = 1;
player_vertical_speed_max_final = 0;

player_on_ground = false;
player_on_wall = 0;

player_dust = 0;

player_jump_buffer = 0;
player_jump_buffer_max = 3;

player_has_control = true;

player_gravity = 0.4;
player_gravity_wall = 0.1;
player_gravity_final = 0;


player_wall_jump_delay = 0;
player_wall_jump_delay_max = 5;

player_closest_gem = 0;
player_near_gem = false;
player_holding_gem = false;
player_held_gem = 0;
player_held_gem_x_target = 0;
player_held_gem_y_target = 0;
player_gem_float_offset = 17;

player_closest_socket = 0;
player_near_socket = false;
// For where to respawn the player if they fall off the map
player_x_spawn = x;
player_y_spawn = y;

// The id for the enter button on the stage
player_enter_button = 0;

// Keeps track if the player is currently pinched between two walls/moving platforms
player_pinched = false;

// The base duration of invincibility
player_invincible_timer_base = 180;
// The current infincibility timer once invicibility is gained
player_invincible_timer = 0;
// Denotes if the player is currently invincible
player_invincible = false;
// For when the player is flickering after being stunned. So that the opacity goes up and down
player_flicker_up = false;

// Gives the player a time cushion to get off of a button after being stunned without pressing the buttons
player_button_stun_delay_base = 90;
player_button_stun_delay_timer = 0;
