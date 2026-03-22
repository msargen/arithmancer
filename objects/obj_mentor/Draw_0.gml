/// @description Draw the interact arrow
draw_self();
if (mentor_player_nearby) draw_sprite_ext(spr_marker, 0, x, y - mentor_interact_offset, 1, -1, 0, c_white, 1);