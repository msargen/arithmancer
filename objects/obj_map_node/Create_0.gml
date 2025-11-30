/// @description map node variable setup

// whether or not the player stops at this node
mn_stop = true;

// routing directions are written with the current direction first and the followup direction being assigned
// for example, if the player is at a stop node with a possible path east, the creation code would include:
// mn_routing[CARDINAL.EAST] = CARDINAL.EAST;
// when approaching a redirect node, if the player was travelling south with a redirect to the east, include:
// mn_routing[CARDINAL.SOUTH] = CARDINAL.EAST;
mn_routing[CARDINAL.NEUTRAL] = CARDINAL.NEUTRAL;
mn_routing[CARDINAL.NORTH] = CARDINAL.NEUTRAL;
mn_routing[CARDINAL.EAST] = CARDINAL.NEUTRAL;
mn_routing[CARDINAL.SOUTH] = CARDINAL.NEUTRAL;
mn_routing[CARDINAL.WEST] = CARDINAL.NEUTRAL;

// room that player will to at this node, can direct to any room
mn_room = rm_world_select;