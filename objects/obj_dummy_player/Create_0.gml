/// @description dummy player variable setup

// set camera to track the dummy player 
with (obj_camera) camera_tracking = other.id;

// direction the dummy player will travel, neutral is stopped
dp_direction = CARDINAL.NEUTRAL;

// this should be kept small (1 or 2) to make sure that the player doesn't overshoot nodes
dp_speed = 1;

// brother if you can't figure these out I can't help you
dp_closest_node = 0;
dp_on_node = true;