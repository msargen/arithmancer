/// @description Drawing Bubbles


scr_text_box(string(bubble_val), ORIENTATION.UP, x, y + sprite_get_height(spr_even_marker), 0, false);

//string_length(bubble_val) * 8 is the width of the text string since each character is 8 pixels wide
//+ 12 is for 6 pixels padding the bubble on either side of the text string
// 26 is to proportionally scale the bubble from the base 26 pixels it was drawn at
image_xscale = (string_length(bubble_val) * 8 + 12) / 26;