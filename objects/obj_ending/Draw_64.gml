/// @description Ending Text Draw
draw_set_color(c_black);
draw_rectangle(0, 0, RES_W, 30, false);
draw_rectangle(0, RES_H - 30, RES_W, RES_H, false);

scr_draw_set_text(c_black, fnt_sign, fa_center, fa_top);

scr_draw_text_shadow(RES_W * 0.5, RES_H * 0.3, c_white, c_black, global.text_offset, ending_text, 0.5);
