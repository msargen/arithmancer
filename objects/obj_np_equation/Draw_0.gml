/// @description Draw the equation text box

var _half_display_width = np_equation_display_width * 0.5;

//Draw The Box
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_roundrect_ext(x - _half_display_width - np_equation_display_border, y - np_equation_display_height - (np_equation_display_border * 2), x + _half_display_width + np_equation_display_border, y, 5, 5, false);
draw_sprite(spr_marker, 0, x, y);
draw_set_alpha(1);

//Draw text
scr_draw_set_text(c_white, fnt_sign, fa_center, fa_top);
draw_text(x, y - np_equation_display_height - np_equation_display_border, np_equation_text_current);