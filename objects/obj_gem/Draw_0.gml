/// @description Draw Gem and Value

// draw sprite before drawing text
draw_self();

// set text to answer unless close to socket
if(instance_exists(obj_player) && (id == obj_player.player_held_gem) && obj_player.player_near_socket && obj_player.player_holding_gem) 
{
	// don't display the text above a gem close to a socket
}
else
{
	//draw gem value above gem
	scr_text_box(string(gem_answer), ORIENTATION.UP, x, y, gem_text_offset)
}