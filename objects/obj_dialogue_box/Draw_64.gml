/// @description Draw the dialogue in a box

if (instance_exists(obj_player))
{
	obj_player.player_has_control = false;
}
draw_set_color(c_blue);

// TODO: update these values once the font size is set
	
// Note: These are not the confirmed fixed numbers for this box
// When RES_W = 320 and RES_H = 180
// W: 8-312 = 304 wide
// H: 8-60 = 52 high
draw_rectangle(12, 8, 308, 52, false);
	
// Char portrat: 32x32
draw_set_color(c_green);
draw_rectangle(18, 14, 50, 46, false);
	
scr_draw_set_text(c_white, fnt_menu, fa_left, fa_top);
draw_text_transformed(dialogue_box_show_line_x[dialogue_box_current_line], dialogue_box_show_line_y[dialogue_box_current_line], dialogue_box_shown_text, 0.5, 0.5, 0);
	
// TODO: maybe make this an "E" or something later
// Draw an arrow
draw_sprite_ext(spr_marker, 0, 300, 44, 0.5, 0.5, 0, c_white, 1);
