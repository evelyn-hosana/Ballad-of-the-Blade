/// @description Create Objects
if (!instance_exists(obj_cursor)) {
	instance_create_layer(0, 0, "GUI", obj_cursor);
}

if (room == rm_one) {
	if (!audio_is_playing(snd_nature)) {
		audio_play_sound(snd_nature, 50, true);
	}
} else if (room == rm_intro) {
	if (!audio_is_playing(snd_ambient)) {
		audio_play_sound(snd_ambient, 50, true);
	}
}