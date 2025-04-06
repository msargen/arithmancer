/// @description Draw Gem and Value

// draw sprite before drawing text
draw_self();

// set text to answer unless close to socket
if(instance_exists(obj_player) && (id == obj_player.player_held_gem) && obj_player.player_near_socket && (obj_player.player_closest_socket.socket_answer > global.over_9000))
{
	// don't display the text above a gem close to an empty socket
}
else
{
	//draw gem value above gem
	scr_text_box(string(gem_answer), ORIENTATION.UP, x, y, gem_text_offset);
}