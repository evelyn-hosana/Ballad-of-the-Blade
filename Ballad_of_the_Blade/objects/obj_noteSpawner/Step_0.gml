/// @description Placing Note Mechanics

// update scale
scale_current = lerp(scale_current, scale_target, scale_speed);
image_xscale = scale_current;
image_yscale = scale_current;

if (selected) {
	if (image_index == 0) {
		image_index = 1;
		global.sprite_frame_selected = 0;
	} else if (image_index == 3) {
		image_index = 4;
		global.sprite_frame_selected = 3;
	}
} else {
	// revert changes
    if (image_index == 1) {
        image_index = 0;
    } else if (image_index == 4) {
        image_index = 3;
    }
}

// hide notes if puzzle not active
if (global.hidden) {
	visible = 0;
	selected = false;
	global.selected_noteSpawner = noone;
} else {
	visible = 1;
}