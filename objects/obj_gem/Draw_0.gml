/// @description Draw Gem and Value

// draw sprite before drawing text
draw_self();

// set text to answer unless close to socket
if(instance_exists(obj_player) && obj_player.near_socket && obj_player.holding_gem) 
{
	obj_player.held_gem.gem_answer_text = "";
}
else
{
	// set text color and position
	scr_draw_set_text(c_white, fnt_menu, fa_center, fa_bottom);
	gem_answer_text = string(gem_answer);
}

// draw gem value above gem
draw_text(x - gem_text_x_offset, y - gem_text_y_offset, gem_answer_text);