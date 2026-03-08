/// @description Text crawl

// TODO: tmp
if (dialogue_box_current_line >= array_length(dialogue_box_text_list))
{
	dialogue_box_current_line = 0;
}

if (dialogue_box_active)
{
	//Progress Text
	if (dialogue_box_text_crawl < dialogue_box_text_line_length[dialogue_box_current_line]) // times number of lines for this one line
	{
		dialogue_box_text_crawl += dialogue_box_text_speed;
	}
	dialogue_box_shown_text = string_copy(dialogue_box_text_list[dialogue_box_current_line], 1, floor(dialogue_box_text_crawl));
	
	if ((dialogue_box_text_crawl < dialogue_box_text_line_length[dialogue_box_current_line]) && global.key_interact)
	{
		dialogue_box_shown_text = dialogue_box_text_list[dialogue_box_current_line];
		// TODO: this might need to be changed once I implement breaking up long lines
		dialogue_box_text_crawl = dialogue_box_text_line_length[dialogue_box_current_line];
		return;
	}
	
	//Next Line
	if ((dialogue_box_text_crawl >= dialogue_box_text_line_length[dialogue_box_current_line]) && global.key_interact)
	{
		dialogue_box_current_line++;
		if (dialogue_box_current_line >= array_length(dialogue_box_text_list))
		{
			dialogue_box_current_line = 0;
		}
		dialogue_box_text_crawl = 0;
		show_debug_message("line length = " + string(dialogue_box_text_line_length[dialogue_box_current_line]));
		
	}
}