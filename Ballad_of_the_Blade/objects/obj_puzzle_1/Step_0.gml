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


if (global.puzzle_1_complete) {
	instance_destroy(); // destroy puzzle and all its instance creations
}