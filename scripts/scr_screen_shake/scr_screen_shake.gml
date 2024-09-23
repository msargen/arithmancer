/// @description scr_screen_shake(magnitude,frame)
/// @arg _magnitude sets the strength of the shake (radius in pixels)
/// @arg _frames sets the length of the shake in frames (60 = 1 second at 60fps)
function scr_screen_shake(_magnitude, _frames) {

	with (obj_camera)
	{
		if (_magnitude > camera_shake_remain)
		{	
			camera_shake_magnitude = _magnitude;
			camera_shake_remain = _magnitude;
			camera_shake_length = _frames;
		}
	}



}
