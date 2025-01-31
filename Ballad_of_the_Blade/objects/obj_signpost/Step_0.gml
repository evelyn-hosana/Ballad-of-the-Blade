// obj_signpost: Step or Key Press Event
if (keyboard_check_pressed(ord("E"))) {
	if (!textbox_created) {
	    var player = instance_nearest(x, y, obj_player);
	    if (player != noone && point_distance(x, y, player.x, player.y) <= interaction_distance) {
	        var textbox = instance_create_layer(x, y, "Player", obj_textbox);
        
	        // pass this signpost's text to the textbox
	        textbox.text = text; 
	        // Or copy if you prefer: textbox.text = array_copy(text);
			textbox_created = true;
	    }
	}
}

if (room == rm_intro && sign_number == 7) {
	if (textbox_created && !instance_exists(obj_textbox)) { // if textbox destroyed but flag is true
		// display puzzle
		instance_create_layer(x, y, "StaffLayer", obj_intro_puzzle);
		textbox_created = false; // reset flag
	}
} else if (room == rm_one && sign_number == 2) {
	if (textbox_created && !instance_exists(obj_textbox)) { // if textbox destroyed but flag is true
		// display puzzle
		instance_create_layer(x, y, "StaffLayer", obj_puzzle_2);
		textbox_created = false; // reset flag
	}
} else if (room == rm_one && sign_number == 4) {
	if (textbox_created && !instance_exists(obj_textbox)) { // if textbox destroyed but flag is true
		// display puzzle
		instance_create_layer(x, y, "StaffLayer", obj_puzzle_3);
		textbox_created = false; // reset flag
	}
}

if (instance_exists(obj_player)) {
	if (point_distance(x, y, obj_player.x, obj_player.y) <= interaction_distance) {
		in_range = true;
	} else {
		in_range = false;
	}
}

if (global.puzzle_active) {
	visible = 0;
} else {
	visible = 1;
}