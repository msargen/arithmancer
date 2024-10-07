/// @description Set Up Camera

view_enabled = true;
view_visible[0] = true;

view_camera[0] = camera_create_view(0, 0, RES_W, RES_H);
camera_set_view_border(view_camera[0], global.margin_buffer, global.margin_buffer);

camera_view = view_camera[0];

camera_tracking = obj_player;
camera_view_width_half = camera_get_view_width(camera_view) * 0.5;
camera_view_height_half = camera_get_view_height(camera_view) * 0.5;
camera_x_move_to = xstart;
camera_y_move_to = ystart;

camera_shake_length = 0;
camera_shake_magnitude = 0;
camera_shake_remain = 0;
camera_buffer = global.margin_buffer;