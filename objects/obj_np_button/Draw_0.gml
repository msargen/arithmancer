/// @description Draw the button and the value assigned to it

draw_self();

scr_draw_set_text(c_white, fnt_sign, fa_center, fa_middle);

switch (image_angle)
{
	case ORIENTATION.DOWN:
		draw_text(x - np_button_text_offset_second, y + np_button_text_offset, string(np_button_key_value));
	break;
	
	case ORIENTATION.LEFT:
		draw_text(x - np_button_text_offset, y, string(np_button_key_value));
	break;
	
	case ORIENTATION.RIGHT:
		draw_text(x + np_button_text_offset - 2, y, string(np_button_key_value));
	break;
	
	default:
		draw_text(x - np_button_text_offset_second, y - np_button_text_offset, string(np_button_key_value));
}