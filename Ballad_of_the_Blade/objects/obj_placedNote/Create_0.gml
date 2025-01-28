/// @description Set Variables and Play Sound
image_speed = 0;

if (instance_exists(obj_snapNoteToKey)) {
    // find nearest snap object
    var snap = instance_nearest(x, y, obj_snapNoteToKey);
    
    // check if snap object has a sound assigned
    if (!is_undefined(snap.sound)) {
        // play corresponding sound
        switch (snap.sound) {
            case snd_d:
                audio_play_sound(snd_d, 1, false); // play sound
                break;
            case snd_e:
                audio_play_sound(snd_e, 1, false);
                break;
            case snd_f:
                audio_play_sound(snd_f, 1, false);
                break;
            case snd_g:
                audio_play_sound(snd_g, 1, false);
                break;
            case snd_a:
                audio_play_sound(snd_a, 1, false);
                break;
            case snd_b:
                audio_play_sound(snd_b, 1, false);
                break;
            case snd_c:
                audio_play_sound(snd_c, 1, false);
                break;
            case snd_d_2:
                audio_play_sound(snd_d_2, 1, false);
                break;
            case snd_e_2:
                audio_play_sound(snd_e_2, 1, false);
                break;
            case snd_f_2:
                audio_play_sound(snd_f_2, 1, false);
                break;
            case snd_g_2:
                audio_play_sound(snd_g_2, 1, false);
                break;
        }
    }
} else {
	instance_destroy(); // if no snap object, destroy notes
}