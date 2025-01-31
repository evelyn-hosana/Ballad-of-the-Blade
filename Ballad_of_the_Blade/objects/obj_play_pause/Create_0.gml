/// @description Define Appearance
image_speed = 0;
image_index = 1;

is_paused = false;
song_to_play = noone;

if (room == rm_intro) {
    song_to_play = snd_intro;
} else if (room == rm_one) {
    var nearest_puzzle = instance_nearest(x, y, obj_puzzle_1);
    
    if (nearest_puzzle != noone) { // ensure a valid instance is found
        if (nearest_puzzle.object_index == obj_puzzle_1) {
            song_to_play = snd_vocal;
        } else if (nearest_puzzle.object_index == obj_puzzle_2) {
            song_to_play = snd_fur_elise;
        } else if (nearest_puzzle.object_index == obj_puzzle_3) {
            song_to_play = snd_ave_maria;
        }
    }
}