/// @description Destroy the player instance and respawn them at the original spawn location

instance_destroy();
// Note, we need to ensure that the layer the player is on for each room is called "Player"
instance_create_layer(player_x_spawn, player_y_spawn, "Player", obj_stunned);