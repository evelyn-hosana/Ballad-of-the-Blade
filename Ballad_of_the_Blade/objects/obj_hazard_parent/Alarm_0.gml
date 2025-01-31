show_debug_message("Damage cooldown expired.");
if (!audio_is_playing(snd_ough)) {
	audio_play_sound(snd_ough, 1, false);
}