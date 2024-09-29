/// @description 
//Move player towards center

layer_x("TitleAssets", min(layer_get_x("TitleAssets") + 1, RES_W * 0.5 - 32));

//Progress Text
ending_letters += ending_text_speed;
ending_text = string_copy(ending_end_text[ending_current_line], 1, floor(ending_letters));

//Next Line
if (ending_letters >= ending_text_length) && (keyboard_check_pressed(vk_anykey))
{
	if (ending_current_line + 1 == array_length(ending_end_text))
	{
		scr_slide_transition(TRANS_MODE.RESTART);
	}
	else
	{
		ending_current_line++;
		ending_letters = 0;
		ending_text_length = string_length(ending_end_text[ending_current_line]);
	}
}