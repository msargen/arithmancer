/// @description Draw Gem and Value

// draw sprite before drawing text
draw_self();

// set text to answer unless close to socket
if(instance_exists(obj_player) && (id == obj_player.player_held_gem) && obj_player.player_near_socket && obj_player.player_holding_gem) 
{
	obj_player.player_held_gem.gem_answer_text = "";
}
else
{
	gem_answer_text = string(gem_answer);
}

// draw gem value above gem
scr_draw_set_text(c_white, fnt_menu, fa_center, fa_bottom);
draw_text(x - gem_text_x_offset, y - gem_text_y_offset, gem_answer_text);