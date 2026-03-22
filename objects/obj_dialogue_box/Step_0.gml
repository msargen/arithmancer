/// @description Text crawl

//Progress Text
if (dialogue_box_text_crawl < dialogue_box_text_line_length[dialogue_box_current_line])
{
	dialogue_box_text_crawl += dialogue_box_text_speed;
}
dialogue_box_shown_text = string_copy(dialogue_box_text_list[dialogue_box_current_line], 1, floor(dialogue_box_text_crawl));
	
if ((dialogue_box_text_crawl < dialogue_box_text_line_length[dialogue_box_current_line]) && global.key_interact)
{
	dialogue_box_shown_text = dialogue_box_text_list[dialogue_box_current_line];
	dialogue_box_text_crawl = dialogue_box_text_line_length[dialogue_box_current_line];
	return;
}
	
//Next Line
if ((dialogue_box_text_crawl >= dialogue_box_text_line_length[dialogue_box_current_line]) && global.key_interact)
{
	dialogue_box_current_line++;
	// Remove the dialogue box at the end of the list of text
	if (dialogue_box_current_line >= array_length(dialogue_box_text_list))
	{
		instance_destroy(id, true);
		return;
	}
	dialogue_box_text_crawl = 0;
	dialogue_box_shown_text = "";
		
}
