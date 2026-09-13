/// @description The mentor npc

mentor_player_nearby = false;

// The offset for the indicator
mentor_interact_offset = 18;

mentor_intro_dialogue[0] = "Hello there!";
mentor_intro_dialogue[1] = "Hello there my good friend who brought me food!";
mentor_intro_dialogue[2] = "Hello there my good friend who brought me food and a large amount of money!"; // 75
mentor_intro_dialogue[3] = "Hello there my good friend who brought me food and a large amount of money but put it in a bad box!"; // 99
mentor_intro_dialogue[4] = "Hello there my good friend who brought me food and a large amount of money but put it in a bad box! I do say, that is quite a shocking turn of events!"; // 150
mentor_intro_dialogue[5] = "Hello there my good friend who brought me food and a large amount of money but put it in a bad box! I do say, that is quite a shocking turn of events! Who could have seen this coming? I didn't thats for sure."; // 208

mentor_loop_dialogue[0] = "Why are you still talking to me?";
mentor_loop_dialogue[1] = "Do you have nothing better to do with your life than to pester a tired old man?";

mentor_ahh_dialogue[0] = "AHHHHHHHHHHHHH! GO AWAY!";

mentor_dialogue_tracker = 0;

mentor_dialogue_map = {
	"intro" : mentor_intro_dialogue,
	"loop" : mentor_loop_dialogue,
	"ahh" : mentor_ahh_dialogue
};

enum MENTOR_DIALOGUE
{
	INTRO = 0,
	LOOP = 1,
	AHH = 3
}


// TODO: for tutorial
// Make the numpads be able to hardcode what side of the button the number is displayed
// Make the tutorial level force safe buttons?
    // I think this needs to be a creation field flag for the buttons that will override the settings menu option. aka, where there is the check for safe buttons, add an or (||) that checks the _force_safe field
// Make the mentor have better dialogue looping. Or just figure out a good way to set that for each mentor guy
// Figure out a way to end the tutorial
// Indicate in the create steps for objects that need to have fields set in each instance create which fields are the ones that need to be set in the creation code.