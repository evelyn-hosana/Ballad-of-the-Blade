/// @description Insert description here
if (!selected) {
    if (global.selected_noteSpawner != noone) {
        global.selected_noteSpawner.selected = false;
    }
    global.selected_noteSpawner = id;
    selected = true;
}