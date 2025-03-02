// Location for all global variable definitions

// Tracker for the amount of flags the player has collected
global.flags_collected = 0;

// The current time remaining in the level
global.time = "";

// Margin for the border of camera visuals
global.camera_buffer = 8;

// For giving outlines/shadow/outline to text
global.text_offset = floor(font_get_size(fnt_menu)/10.0);

// Sets text scaling across the GUI
global.text_scale = 0.5;

// The proximity distance for interacting with objects
global.interact_distance = 32;

// Time source that counts seconds to track time in levels
//     Is not a simple variable to assign a base value to here
// global.level_time_source

// Distance between player character and interactable items
global.interact_distance = 32;