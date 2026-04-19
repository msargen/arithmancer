/// @description Countdown Notification Timers

// Check for active toasts
toast_count = array_length(toast_notification_array);

// Count down timers on all active toasts
if (toast_count > 0)
{
	for (var _i = 0; _i < toast_count; _i++)
	{
		toast_notification_timers[_i]--;
		
		// Slide the toast in at the beginning
		if (toast_notification_timers[_i] > (toast_time - toast_slide_time))
		{
			toast_slide_adjustment = (toast_time - toast_slide_time - toast_notification_timers[_i]) / toast_slide_time;
		}
		// Slide the toast off at the end
		else if (toast_notification_timers[_i] < toast_slide_time)
		{
			toast_slide_adjustment = (toast_notification_timers[_i] - toast_slide_time) / toast_slide_time;
		}
		else // Set adjustment to 0 otherwise
		{
			toast_slide_adjustment = 0;
		}
		
		// Ternary if this toast is the 1st (zero index) toast since micah wants to make this complicated and won't let there be a zero index base toast to base everything else off of
		var _toast_previous_height = (_i == 0) ? toast_negative_one_height_because_micah_hates_the_number_one : toast_display_heights[_i - 1]; 
		
		// Calculate height of toast
		toast_display_heights[_i] = _toast_previous_height + toast_to_toast * (1 + toast_slide_adjustment);
		
		// Remove toast once it's done
		if (toast_notification_timers[_i] <= 0)
		{
			array_delete(toast_notification_array, _i, 1);
			array_delete(toast_notification_timers, _i, 1);
			toast_count--;
			_i--;
		}
	}
}