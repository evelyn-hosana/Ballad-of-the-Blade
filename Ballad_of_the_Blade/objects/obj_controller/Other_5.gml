/// @description Destroy Objects
if (instance_exists(obj_cursor)) {
	instance_destroy(obj_cursor);
}

if (audio_is_playing(snd_ambient) || audio_is_playing(snd_nature)) {
	audio_stop_sound(snd_ambient);
	audio_stop_sound(snd_nature);
}