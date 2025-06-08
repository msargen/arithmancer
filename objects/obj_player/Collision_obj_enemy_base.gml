/// @description Handles collision with all enemies

// If the player is currently invincible, don't stun them
if (!player_invincible)
{
	scr_stun_player();
}
