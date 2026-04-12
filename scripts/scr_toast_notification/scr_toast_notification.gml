/// @description Displays a temporary notification for a short amount of time
/// @arg _message The message to be displayed in the notification
function scr_toast_notification(_message)
{
	with (obj_toast_notification)
	{
		// Add the notification to the queue in obj_toast_notification
		array_push(toast_notification_array, _message);
		array_push(toast_notification_timers, toast_time);
	}
}