/// @description Change Rooms
if (audio_is_playing(snd_main_menu)) { audio_stop_sound(snd_main_menu); }
room_goto_next();