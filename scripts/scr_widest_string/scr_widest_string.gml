/// @description This function returns the width of the widest string in an array
/// @arg _array the array of strings to be checked
function scr_widest_string(_array)
{
	var _widest = 0;
	
	for (var _i = 0; _i < array_length(_array); _i++)
	{
		// Check the width of each element against the longest so far
		if (string_width(_array[_i]) > _widest)
		{
			// Update the longest when a longer element is found
			_widest = string_width(_array[_i]);
		}
	}
	
	return (_widest);
}