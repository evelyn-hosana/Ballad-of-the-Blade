/// @description Set Variables
fade_speed = 0.02; // speed of fade in/out
fade_alpha = 0; // current alpha for text
fade_direction = 1; // direction of fade (1 = in, -1 = out)


// play background music on repeat
if (!audio_is_playing(snd_main_menu)) { audio_play_sound(snd_main_menu, 1, true); }