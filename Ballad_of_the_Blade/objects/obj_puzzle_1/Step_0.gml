/// @description Puzzle Mechanics

center_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2;
center_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2;

x = center_x;
y = center_y;

// iterate through all instances of related objects
with (obj_noteSpawner) {
    x = other.x + relative_x;
    y = other.y + relative_y;
}

with (obj_play_pause) {
    x = other.x + relative_x;
    y = other.y + relative_y;
}

if (!instance_exists(obj_placeNoteArea) && !global.hidden) {
	spawn_area();
}

if (!global.puzzle_1_complete && !global.hidden) {
    var temp_correct = true; // temporary flag for current check

    // check each section's "correct" property
    for (var i = 1; i <= total_answers; i++) {
        var section = variable_instance_get(self, "section_" + string(i));
        if (section != noone) {
            if (!section.correct) {
                temp_correct = false; // if any section is incorrect, puzzle is not complete
                break;
            }
        } else {
            show_debug_message("Section " + string(i) + " does not exist.");
            temp_correct = false;
            break;
        }
    }

    // update "all_correct" only when conditions change
    if (temp_correct && !all_correct) {
        all_correct = true; // set to true only when all are correct
        audio_play_sound(snd_scarborough_fair, 1, false); // play audio

        // set a timer to wait for audio to finish
        var audio_length = audio_sound_length(snd_scarborough_fair);
        alarm[0] = ceil(room_speed * audio_length); // trigger alarm after audio finishes
    }
}

if (global.puzzle_1_complete && !global.puzzle_active) {
	instance_destroy();
}