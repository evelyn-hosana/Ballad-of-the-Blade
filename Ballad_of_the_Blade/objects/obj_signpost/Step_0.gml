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

if (sign_number == 7) {
	show_debug_message("SIGN");
	if (textbox_created && !instance_exists(obj_textbox)) { // if textbox destroyed but flag is true
		// display puzzle
		instance_create_layer(x, y, "signposts", obj_intro_puzzle);
		show_debug_message("Puzzle created");
		textbox_created = false; // reset flag
	}
}