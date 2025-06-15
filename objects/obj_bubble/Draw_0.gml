/// @description Drawing Bubbles

scr_text_box(string(bubble_val), ORIENTATION.UP, x, y + sprite_get_height(spr_even_marker), 0, false);
image_xscale = (string_length(bubble_val) * 8 + 12)/26;