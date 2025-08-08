/// @description Display Controller Connect/Disconnect

// fade out display message when controller is connected or disconnected
if (controller_text_opacity > 0)
{
	scr_draw_set_text(c_white, global.monotype_font, fa_center, fa_middle);
	draw_set_alpha(controller_text_opacity);
	draw_text(RES_W / 2, RES_H / 2, controller_text_message);
	draw_set_alpha(1);
	controller_text_opacity = controller_text_opacity - 0.01;
}