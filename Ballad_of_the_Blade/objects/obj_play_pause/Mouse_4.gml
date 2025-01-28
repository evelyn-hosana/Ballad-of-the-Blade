/// @description Pause/Play Audio
if (is_paused) {
    show_debug_message("Resuming sound...");
    audio_resume_sound(song_to_play);
    is_paused = false; // update state
	image_index = 0;
} else if (!audio_is_playing(song_to_play)) {
    show_debug_message("Playing sound...");
    audio_play_sound(song_to_play, 1, true);
	image_index = 0;
} else {
    show_debug_message("Pausing sound...");
    audio_pause_sound(song_to_play);
    is_paused = true; // update state
	image_index = 1;
}