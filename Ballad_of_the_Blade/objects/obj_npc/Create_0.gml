/// @description Set Variables

// enum class for NPC states
enum NPCState {
	INTRO,
	AUDIO,
	QUESTION,
	MISSION_SENT,
	MISSION_RECEIVED,
	FOLLOW,
	FINAL_THOUGHTS,
	EXIT
}

// initial state
state = NPCState.INTRO;
show_indicator = false;
textbox_created = false;
audio_played = false;

// follow state
vspd = 0;
hspd = 0;
dist = 50; // distance to maintain
range = 50;
in_range = false;

// animation control
last_xdir = 1; // default to right
image_index = 16; // start with idle right
image_speed = 0.2;