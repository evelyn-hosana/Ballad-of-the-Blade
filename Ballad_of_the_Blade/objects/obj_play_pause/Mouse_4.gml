/// @description Pause/Play Audio
if (is_paused) {
    show_debug_message("Resuming sound...");
    audio_resume_sound(snd_vocal);
    is_paused = false; // update state
	image_index = 0;
} else if (!audio_is_playing(snd_vocal)) {
    show_debug_message("Playing sound...");
    audio_play_sound(snd_vocal, 1, false);
	image_index = 0;
} else {
    show_debug_message("Pausing sound...");
    audio_pause_sound(snd_vocal);
    is_paused = true; // update state
	image_index = 1;
}