// Location for all global variable definitions

// Tracker for the amount of flags the player has collected
global.equations_solved = 0;

// The current time remaining in the level
global.time = "";

// Margin for the border of camera visuals
global.camera_buffer = 8;

// For giving outlines/shadow/outline to text
global.text_offset = floor(font_get_size(fnt_menu)/10.0);

// Sets text scaling across the GUI
global.text_scale = 0.5;

// Time source that counts seconds to track time in levels
//     Is not a simple variable to assign a base value to here
// global.level_time_source

// Distance between player character and interactable items
global.interact_distance = 32;

// Monotype font drawn for better looking equations
global.monotype_font = font_add_sprite(spr_monotype_font, ord("!"), false, 0);

// Vegeta number for completed sockets
global.over_9000 = -9001
