/// @description Draw Gem and Value

// draw sprite before drawing text
draw_self();

// set text color and position
scr_draw_set_text(c_white, fnt_menu, fa_center, fa_bottom);

// draw gem value above gem
draw_text(x - text_h_offset, y - text_y_offset, string(answer));
