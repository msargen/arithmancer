/// @description Handles showing dialogue box text without needed to copy many lines for each section of dialogue
/// @arg _text_list The array of dialogue lines to show
function scr_display_dialogue(_text_list)
{ 
	// x and y will be irrelevant since the text box is transparent and drawn in gui
	// layer will be the layer of the calling object
	with (instance_create_layer(x, y, layer, obj_dialogue_box))
		{
			var _dialogue = scr_format_dialogue_box_text(_text_list, dialogue_box_max_line_chars, dialogue_box_max_lines);
			dialogue_box_text_list = _dialogue[0];
			dialogue_box_text_line_length = _dialogue[1];
			dialogue_box_show_line_x = _dialogue[2];
			dialogue_box_show_line_y = _dialogue[3];
		}
}


/// @description Formats the passed list of dialogue text to ensure it can fit in the box cleanly/correctly
/// @arg _text_list The array of dialogue lines to format
/// @arg _max_line_chars The maximum number of characters to have per line
/// @arg _max_lines The maximum number of new line breaks ("\n") to allow per single text array index line
/// @return An array of arrays. Index 0: The formatted list of dialogue lines. Index 1: The length of each dialogue line. Index 2: The starting X position for each line. Index 3: The starting Y position for each line.
function scr_format_dialogue_box_text(_text_list, _max_line_chars, _max_lines) 
{
	var _formatted_text_list = array_create(0);
	var _list_line_length = array_create(0);
	var _list_x_pos = array_create(0);
	var _list_y_pos = array_create(0);
	
	for (var _i = 0; _i < array_length(_text_list); ++_i)
	{
		if (string_length(_text_list[_i]) > _max_line_chars)
		{
			// The text line is too long. Split it up into fragments adding "\n" to break the text across
			// multiple vertical lines in the box.
			
			// Find how many times the line will need to be broken up
			var _split_num = 2;
			while (ceil(string_length(_text_list[_i]) / _split_num) > _max_line_chars)
			{
				_split_num++;
			}
		
			var _split_length = ceil(string_length(_text_list[_i]) / _split_num);
			var _longest_fragment = 0;
			var _words = string_split(_text_list[_i], " ");
			var _new_line_lol = "";
			var _line_frag_length = 0;
			for (var _j = 0; _j < array_length(_words); ++_j)
			{
				// The + 1 is for the added space after the word
				_line_frag_length += string_length(_words[_j]) + 1;
				if (_line_frag_length < _split_length)
				{
					_new_line_lol += _words[_j] + " ";	
				}
				else if (_line_frag_length < _max_line_chars)
				{
					_new_line_lol += _words[_j] + "\n";
					if (_line_frag_length > _longest_fragment) _longest_fragment = _line_frag_length;
					_line_frag_length = 0;
				}
				else
				{
					// For when the line fragment is perfectly the same length of the maxmimum line length.
					_new_line_lol = string_trim_end(_new_line_lol);
					_new_line_lol += "\n" + _words[_j] + " ";
					_longest_fragment = _max_line_chars;
					_line_frag_length = string_length(_words[_j]) + 1;
				}
			}
			_new_line_lol = string_trim_end(_new_line_lol);
			// The total number of lines will equal the number of line breaks plus one. Hence why the check
			// is for >= max lines instead of just >
			var _line_breaks = string_count("\n", _new_line_lol);
			if (_line_breaks >= _max_lines)
			{
				show_debug_message("Your line = " + _new_line_lol);
				show_error("Your sentence does not fit within the dialogue box. Split it up! Look at the debug logs for specific string.", true); 	
			}
			array_push(_formatted_text_list, _new_line_lol);
			array_push(_list_line_length, string_length(_text_list[_i]));
			// NOTE: these values for the x/y position were chosen based off of trying multiple different numbers
			// and seeing which one looked the best. They will probably change once we settle on a font size
			// and look.
			array_push(_list_x_pos, 179 - floor(_longest_fragment * 1.6));
			var _y_offset = 5 * _line_breaks;
			array_push(_list_y_pos, 29 - _y_offset);
		}
		else
		{
			array_push(_list_line_length, string_length(_text_list[_i]));
			var _line_breaks = string_count("\n", _text_list[_i]);
			array_push(_list_x_pos, 179 - floor(string_length(_text_list[_i]) * 1.6));
			var _y_offset = 5 * _line_breaks;
			array_push(_list_y_pos, 29 - _y_offset);
			array_push(_formatted_text_list, _text_list[_i]);
		}
	}
	return [_formatted_text_list, _list_line_length, _list_x_pos, _list_y_pos];
}