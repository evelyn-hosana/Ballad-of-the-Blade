// obj_sheetMusicNotesPlatform: Collision with obj_player

// check if the player is actually moving downward (typical “just landed” logic)
if (other.vspd > 0) {
    if (!alreadyPlayed) {
        audio_play_sound(mySound, 1, false);
        alreadyPlayed = true;
    }
} else {
    // If the player is not moving downward, reset
    alreadyPlayed = false;
}

show_debug_message("Collision triggered!")