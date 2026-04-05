/// @description Draw the dialogue in a box

if (instance_exists(obj_player))
{
	obj_player.player_has_control = false;
}

// Note: remember when counting pixels to count the starting value (because pixel space is zero indexed)
	
// When RES_W = 320 (0-319) and RES_H = 180 (0-179)
// W: 12-307 = 296 wide
// H: 8-51 = 44 high
draw_set_color(c_blue);
draw_rectangle(12, 8, 307, 51, false);
	
// Character portrat: 32x32
draw_set_color(c_green);
draw_rectangle(18, 14, 49, 45, false);

// TODO: figure out the font we want to use and make the font an arg for the dialogue box script
//		 Will allow for different characters to have different fonts if desired
scr_draw_set_text(c_white, global.menu_font, fa_left, fa_top);
draw_text_transformed(dialogue_box_show_line_x[dialogue_box_current_line], dialogue_box_show_line_y[dialogue_box_current_line], dialogue_box_shown_text, dialogue_box_text_scale, dialogue_box_text_scale, 0);


// TODO: maybe make this an "E" or something later (or whatever the interract button/key is)
// Draw an arrow
draw_sprite_ext(spr_marker, 0, 300, 44, 0.5, 0.5, 0, c_white, 1);
