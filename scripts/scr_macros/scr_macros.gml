// Location for all macro definitions

// For a simple and easy to add to/expand screen resolution. A 16:9 aspect ratio.
#macro RES_W 320
#macro RES_H 180


// This will set up the player window when the game loads and scale everything according to the set resolution
window_set_size(RES_W, RES_H);
surface_resize(application_surface, RES_W, RES_H);
display_set_gui_size(RES_W, RES_H);

// Allows the game window (when not in full screen) to be fully within the monitor when initially compiled
// TODO: move this to a better place
window_set_position(50, 50);