/// @description Draw black bars

if (transition_mode != TRANS_MODE.OFF)
{
	draw_set_color(c_black);
	draw_rectangle(0, 0, transition_width,transition_percent * transition_height_half, false);
	draw_rectangle(0, transition_height, transition_width, transition_height - (transition_percent * transition_height_half), false);
}