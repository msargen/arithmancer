/// @description Draw the arrow
draw_self();
if(bubble_flag_equation_display)
{
	scr_text_box(bubble_flag_text, ORIENTATION.UP, x, y, bubble_flag_equation_offset, true);
}
else if (bubble_flag_player_nearby)
{
	draw_sprite_ext(spr_marker, 0, x, y - 20, 1, -1, 0, c_white, 1);
}