/// @description 

var _half_display_width = equation_text_display_width * 0.5;

//Draw The Box
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_roundrect_ext(x - _half_display_width - equation_text_display_border, y - equation_text_display_height - (equation_text_display_border * 2), x + _half_display_width + equation_text_display_border, y, 5, 5, false);
draw_sprite(spr_marker, 0, x, y);
draw_set_alpha(1);

//Draw text
scr_draw_set_text(c_white, fnt_sign, fa_center, fa_top);
draw_text(x, y - equation_text_display_height - equation_text_display_border, equation_text_text_current);