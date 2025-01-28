/// @description Define Appearance
image_speed = 0;
image_index = 1;

is_paused = false;

if (room == rm_intro) {
	song_to_play = snd_intro;
} else if (room == rm_one) {
	song_to_play = snd_vocal;
}