/// @description Equations Completed Counter (and time eventually)
if (room != rm_menu) && (instance_exists(obj_player))
{
	{
		game_flags_collected_text_scale = max(game_flags_collected_text_scale * 0.95, 1.25);
		scr_draw_set_text(c_black, fnt_menu, fa_right, fa_top);
		draw_text_transformed(RES_W - 8, 12, string(global.flags_collected) + " Flags Collected", game_flags_collected_text_scale, game_flags_collected_text_scale, 0);
		draw_set_color(c_white);
		draw_text_transformed(RES_W - 10, 10, string(global.flags_collected) + " Flags Collected", game_flags_collected_text_scale, game_flags_collected_text_scale, 0);
	}
	{
		var _timescale = 1.25;
		scr_draw_set_text(c_black, fnt_menu, fa_left, fa_top);
		draw_text_transformed(RES_W-1000,12,string(global.time) + " Time Remaining", _timescale, _timescale, 0);
		draw_set_color(c_white);
		draw_text_transformed(RES_W-1002,10,string(global.time) + " Time Remaining", _timescale, _timescale, 0);
	}
}
