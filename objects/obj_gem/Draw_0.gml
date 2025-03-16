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
	//draw gem value above gem
	scr_text_box(gem_answer_text, ORIENTATION.UP, x, y, gem_text_offset)
}