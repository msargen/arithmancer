/// @description Handles collison with hazards that rest position with no knockback

//Checks if player spawn position is within the position of the hazard
while (place_meeting(player_x_spawn, player_y_spawn, obj_reset_hazard))
{
	//Shift the player to left if speed is positive or right if speed is negative	
	if (player_horizontal_speed > 0)
	{
		player_x_spawn--;
	}
	else if (player_horizontal_speed < 0)
	{
		player_x_spawn++;
	}
}

instance_destroy();
// Note, we need to ensure that the layer the player is on for each room is called "Player"
var _stunned_inst = instance_create_layer(player_x_spawn, player_y_spawn, "Player", obj_stunned);

with (_stunned_inst)
{
	stunned_player_spawn_x = other.player_x_spawn;
	stunned_player_spawn_y = other.player_y_spawn;
}