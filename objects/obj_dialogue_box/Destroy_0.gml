/// @description Remove the dialogue box
if (instance_exists(obj_player))
{
	obj_player.player_has_control = true;
	global.key_interact = false;
}