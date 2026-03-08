/// @description For showing dialogue

dialogue_box_active = false;

// TODO: figure this out once we have figured out the size of the overall dialogue box
dialogue_box_max_line_chars = 75;
// TODO: figure this out (will probably be 2-3 but can go up to 5 right now)
dialogue_box_max_lines = 3;

// TODO: tmp
dialogue_box_text_list[0] = "Hello there!";
dialogue_box_text_list[1] = "Hello there my good friend who brought me food!";
dialogue_box_text_list[2] = "Hello there my good friend who brought me food and a large amount of money!";
dialogue_box_text_list[3] = "Hello there my good friend who brought me food and a large amount of money but put it in a bad box!"; // 75
dialogue_box_text_list[4] = "Hello there my good friend who brought me food and a large amount of money but put it in a bad box! I do say, that is quite a shocking turn of events!"; // 150
dialogue_box_text_list[5] = "Hello there my good friend who brought me food and a large amount of money but put it in a bad box! I do say, that is quite a shocking turn of events! Who could have seen this coming? I didn't thats for sure."; // 208

dialogue_box_text_line_length = array_create(0);
dialogue_box_text_line_show_length = array_create(0);
dialogue_box_show_line_y = array_create(0);
dialogue_box_show_line_x = array_create(0);

show_debug_message("HIIIIIIIIIIIII");

for (var _i = 0; _i < array_length(dialogue_box_text_list); ++_i)
{
	show_debug_message("i = " + string(_i));
	show_debug_message("line length = " + string(string_length(dialogue_box_text_list[_i])));
	if (string_length(dialogue_box_text_list[_i]) > dialogue_box_max_line_chars)
	{
		show_debug_message("too long");
		
		// TODO: maybe have a while loop here to break it up better
		var _split_num = 2;
		while (ceil(string_length(dialogue_box_text_list[_i]) / _split_num) > dialogue_box_max_line_chars)
		{
			_split_num++;
		}
		show_debug_message("split num = " + string(_split_num));
		
		var _split_length = ceil(string_length(dialogue_box_text_list[_i]) / _split_num);
		var _longest_frag = 0;
		var _words = string_split(dialogue_box_text_list[_i], " ");
		var _new_line_lol = "";
		show_debug_message("Split length = " + string(_split_length));
		var _line_frag_length = 0;
		for (var _j = 0; _j < array_length(_words); ++_j)
		{
			_line_frag_length += string_length(_words[_j]) + 1;
			if (_line_frag_length < _split_length)
			{
				_new_line_lol += _words[_j] + " ";	
			}
			else if (_line_frag_length < dialogue_box_max_line_chars)
			{
				_new_line_lol += _words[_j] + "\n";
				if (_line_frag_length > _longest_frag) _longest_frag = _line_frag_length;
				show_debug_message("Here 1 _line_frag_length: " + string(_line_frag_length));
				_line_frag_length = 0;
				show_debug_message("Here 1: " + _words[_j]);
			}
			else
			{
				_new_line_lol = string_trim_end(_new_line_lol);
				_new_line_lol += "\n" + _words[_j] + " ";
				_longest_frag = dialogue_box_max_line_chars;
				show_debug_message("Here 2 _line_frag_length: " + string(_line_frag_length));
				_line_frag_length = string_length(_words[_j]) + 1;
				show_debug_message("Here 2: " + _words[_j]);
			}
		}
		_new_line_lol = string_trim_end(_new_line_lol);
		// TODO: count \n chars?
		var _new_lines = string_count("\n", _new_line_lol);
		show_debug_message("new lines 1 = " + string(_new_lines));
		show_debug_message("_longest_frag = " + string(_longest_frag));
		show_debug_message("_new_line_lol = " + _new_line_lol);
		if (_new_lines > 2)
		{
			show_debug_message("Your line = " + _new_line_lol);
			show_error("Your sentence Does not fit within the dialogue box. Split it up! Look at the debug logs for specific string.", true); 	
		}
		dialogue_box_text_list[_i] = _new_line_lol;
		array_push(dialogue_box_text_line_length, string_length(dialogue_box_text_list[_i]));
		array_push(dialogue_box_text_line_show_length, _longest_frag);
		array_push(dialogue_box_show_line_x, 179 - floor(_longest_frag * 1.6));
		var _ah = 5 * _new_lines;
		array_push(dialogue_box_show_line_y, 29 - _ah);
	}
	else
	{
		array_push(dialogue_box_text_line_length, string_length(dialogue_box_text_list[_i]));
		array_push(dialogue_box_text_line_show_length, string_length(dialogue_box_text_list[_i]));
		var _new_lines = string_count("\n", dialogue_box_text_list[_i]);
		show_debug_message("new lines 2 = " + string(_new_lines));
		array_push(dialogue_box_show_line_x, 179 - floor(string_length(dialogue_box_text_list[_i]) * 1.6));
		var _ah = 5 * _new_lines;
		array_push(dialogue_box_show_line_y, 29 - _ah);
	}
}

// TODO: CLEAN UP WHAT I HAVE ADDED AND FIGURE OUT WHAT HAS BEEN DONE AND WHAT TO DO NEXT!!!!!!!!!!!!
// TODO: edit the lines and save them here? (For splitting up too long of lines)
// TODO: have another array that tracks the "line start" index for each box option?
// TODO: Add case for when the line is too dang long (even for the split up)

dialogue_box_text_speed = 0.5;
dialogue_box_shown_text = "";
dialogue_box_text_crawl = 0;
dialogue_box_current_line = -1;
dialogue_box_line_length = dialogue_box_text_line_length[0];

// TODO: figure out new text layout locations with left and top set
// TODO: figure out how to break up long sentences. Look at string_split

// TODO: make a script that interacts with this object?
// TODO: Turn text crawl into a script?
// TODO: Does this need to be a persistent object or could it just be created when needed? Like an equation text bubble.
// -> yes, make this a created object to ease overhead. Then when it is created, pass/set values for the conversation
// TODO: figure out how to flip the portrait side and how that will affect text location. (If we even want this. Do this one later)