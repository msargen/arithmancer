/// @description Draw Toast Notifications

// Set font values
scr_draw_set_text(c_white, toast_font, fa_center, fa_top)

// Draw active toasts
if (toast_count > 0)
{
	for (var _i = toast_count - 1; _i >= 0; _i--)
	{
		 // Get width of the toast
		 toast_width = string_width(toast_notification_array[_i]) + 2 * toast_padding;
		 
		 // Draw rectangle for toast background
		 // For odd width, ceil pushes it to the right one half pixel to keep it in line with all the other pixels
		 var _left = ceil((RES_W - toast_width) / 2);
		 var _top = toast_display_heights[_i];
		 var _right = ceil((RES_W + toast_width) / 2) - 1;
		 var _bottom = toast_display_heights[_i] + toast_height - 1;
		 draw_rectangle_colour(_left, _top, _right, _bottom, c_grey, c_grey, c_grey, c_grey, false);
		 
		 // Draw toast message on background
		 draw_text(RES_W / 2, toast_display_heights[_i] + toast_padding, toast_notification_array[_i]);
	}
}