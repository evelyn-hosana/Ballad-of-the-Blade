/// @description Set Variables

// enum class for NPC states
enum NPCState {
	INTRO,
	AUDIO,
	QUESTION,
	MISSION_SENT,
	MISSION_RECEIVED
}

// initial state
state = NPCState.INTRO;
show_indicator = false;
textbox_created = false;
textbox_closed = false;
audio_played = false;
state_timer = -1;