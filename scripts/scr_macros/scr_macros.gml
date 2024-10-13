// Location for all macro definitions

// Current screen resolution
#macro RES_W 1024
#macro RES_H 768

// This will set up the player window when the game loads and scale everything according to the set resolution
window_set_size(RES_W, RES_H);
surface_resize(application_surface, RES_W, RES_H);
window_set_fullscreen(true);
display_set_gui_size(RES_W, RES_H);

// Probably the ideal to keep it simple
// Will probably want 8x8 pixels for the tiles. 16x16 for the character. And varying sizes for the other sprites.
//#macro RES_W 320
//#macro RES_H 180

// For maximizing things, but I don't think we want to do this
//#macro RES_W display_get_width()
//#macro RES_H display_get_height()