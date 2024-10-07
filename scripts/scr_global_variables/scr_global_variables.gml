// Location for all global variable definitions

// Tracker for the amount of flags the player has collected
global.flags_collected = 0;
// The current time remaining in the level
global.time = "";

// Margin for the boarder of visuals (will need to be updated to 8 I believe if we change our tile size to 8x8 instead of 32x32)
global.margin_buffer = 32;

// For giving outlines/shadow/outline to text
global.text_offset = floor(font_get_size(fnt_menu)/10.0);