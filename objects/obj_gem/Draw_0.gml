/// @description Draw Gem and Value

// draw sprite before drawing text
draw_self();

// set text color and position
scr_draw_set_text(c_white, fnt_menu, fa_center, fa_bottom);

// set text to answer unless close to socket
answer_text = string(answer);
if(obj_gem_socket.near_socket && instance_exists(obj_player) && obj_player.holding_gem) {closest_gem.answer_text = "";}

// draw gem value above gem
draw_text(x - text_x_offset, y - text_y_offset, answer_text);