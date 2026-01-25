/// @description 

//Move player towards center
layer_x("TitleAssets", min(layer_get_x("TitleAssets") + 1, RES_W * 0.5 - global.camera_buffer));

//Progress Text
if (ending_letters < ending_text_max)
{
	ending_letters += ending_text_speed;
}
ending_text = string_copy(ending_end_text[ending_current_line], 1, floor(ending_letters));

//Next Line
if (ending_letters >= ending_text_length) && (keyboard_check_pressed(vk_anykey) || global.key_back || global.key_jump || global.key_pause || global.key_select)
{
	if (ending_current_line + 1 == array_length(ending_end_text))
	{
		scr_slide_transition(TRANS_MODE.GOTO, rm_menu);
	}
	else
	{
		ending_current_line++;
		ending_letters = 0;
		ending_text_length = string_length(ending_end_text[ending_current_line]);
	}
}