/// @description Initialize Toast Notifications

// Create array of toast strings and timers with one unused at the beginning
toast_notification_array = array_create(0, "");
toast_notification_timers = array_create(0, 0);

toast_count = 0;
toast_font = global.menu_font;

// Default time on screen in frame at 60fps
toast_time = 180;
// Time it takes to slide onto/off of the screen in frames at 60fps
toast_slide_time = 30;

// Space around the toast in pixels
toast_spacing = 1;
// Padding between text and edge of toast in pixels
toast_padding = 2;
// Height of toast
toast_height = font_get_size(toast_font) + toast_padding;
// Total height of toast + padding
toast_to_toast = toast_height + 2 * toast_spacing;
// Height at which to draw the toast
toast_display_heights = array_create(0, 0);
// Width of toast, calculated at Draw GUI
toast_width = 0;

// Adjustment of height for sliding onto and off of screen, ranges from -1 to 0
toast_slide_adjustment = 0;
// Update base notification height for cascade reference
toast_negative_one_height_because_micah_hates_the_number_one = 0 - toast_to_toast + toast_padding;