/// @description Insert description here
// You can write your code in this editor

draw_self();

scr_draw_set_text(c_white, fnt_sign, fa_center, fa_middle);

if (np_button_orientation == 0)
{
	draw_text(x - np_button_text_offset_second, y - np_button_text_offset, string(np_button_key_value));
}
else if (np_button_orientation == 1)
{
	draw_text(x - np_button_text_offset_second, y + np_button_text_offset, string(np_button_key_value));
}
else if (np_button_orientation == 2)
{
	draw_text(x - np_button_text_offset, y, string(np_button_key_value));
}
else if (np_button_orientation == 3)
{
	draw_text(x + np_button_text_offset - 2, y, string(np_button_key_value));
}