/// @description Ending Text Draw
draw_set_color(c_black);
draw_rectangle(0, 0, RES_W, 128, false);
draw_rectangle(0, RES_H - 128, RES_W, RES_H, false);

scr_draw_set_text(c_black, fnt_sign, fa_center, fa_top);
draw_text(RES_W * 0.5 + 2, RES_W * 0.3 + 2, ending_text);
draw_set_color(c_white);
draw_text(RES_W * 0.5, RES_W * 0.3, ending_text);
