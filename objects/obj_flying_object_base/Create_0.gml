/// @description Set flying object base variables
// Can set here --> 

// These need to be initialized to extremes so that directions we don't want the platform to move are ignored
fob_max_x = -global.over_9000;
fob_max_y = -global.over_9000;
fob_min_x = global.over_9000;
fob_min_y = global.over_9000;

// Movement speeds: Default speed is 1.0. Speed should be kept lower than the width of walls (aka, 8)
// Set one or the other depending on how you want the platform to move (in a specific direction). 
// Set both for diagonal movement (not fully implemented yet)
// Note: Set both base and actual speed in instance creation code
fob_horizontal_speed = 0;
fob_vertical_speed = 0;

// The base speed for linear movement. Need to set this for when the platform changes direction is might not move the full
// speed and thus will need to be set back to the base speed when it starts moving in the opposite direction
fob_horizontal_speed_base = 0;
fob_vertical_speed_base = 0;

// Indicates a varying speed path for the platform. Only min/max x/y need to be set when these are true.
// Set both to true for circular/ellipsoid movement
fob_cos_move_x = false;
fob_sin_move_y = false;

// The direction circular movement should travel in. +1 = clockwise, -1 = counterclockwise. Default is clockwise.
fob_circle_direction = 1;
// Can't be zero (division by zero). The smaller the absolute number, the faster the movement.
fob_sin_frequency = 1;

// <-- throuch here in object creation code


// Keeps track if the player is in contact with the moving platform
fob_player_contact = false;

// Tracks the amount of frames that have gone by for sinusoidal movement of platforms
// Fixes the issue of using current_time that would cause platorms to jump around when pausing/unpausing
fob_sin_time_tracker = 0.0;

// Keeps track of when the platorm is changing directions for linear movement
fob_change_direction_x = false;
fob_change_direction_y = false;
