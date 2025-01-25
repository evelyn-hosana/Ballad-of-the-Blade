/// @description Spawn Text Box When Interacted With

function is_player_in_range() {
	var range = 100;
	var player = instance_nearest(x, y, obj_player);
	
    if (!instance_exists(player)) return false;
    var dx = player.x - x;
    var dy = player.y - y;
    return (sqrt(dx * dx + dy * dy) <= range);
}

// state management
switch (state) {
    case NPCState.INTRO:
        if (!textbox_created) {
            if (is_player_in_range() && keyboard_check_pressed(ord("E"))) {
                // create textbox and set its dialog
                var textbox = instance_create_layer(x, y, "GUI", obj_textbox);
				textbox.text = [];
                textbox.text[0] = "Hey, you there! You with the fancy suit! Help me out will you?";
                textbox.text[1] = "Can you read music notes? There's this song that means a lot to me, but the pages are worn and I can't seem to fill the missing notes!";
                textbox.text[2] = "...";
                textbox.text[3] = "What, it's my great-grandma's song! I'm musically illiterate. And you look like you know a thing or two...";
                textbox.text[4] = "Listen, if you can figure this out for me, I can tell you a secret about that violin-sword you have by your side.";
				textbox.text[5] = "I'll sing the tune as best as I can, and you help fill in the rest!"
				textbox_created = true;
            }
            show_indicator = true;
        } else {
            show_indicator = false;
        }

        // Transition to the next state after the textbox is destroyed
        if (textbox_created && !instance_exists(obj_textbox)) {
			textbox_created = false; // reset flag
            state = NPCState.AUDIO;
        }
        break;
		
	case NPCState.AUDIO:
		if (!audio_played) {
            audio_play_sound(snd_vocal, 1, false);
            audio_played = true;
        }

        if (!audio_is_playing(snd_vocal)) {
            state = NPCState.QUESTION;
            audio_played = false; // reset flag
        }
        break;
	
	case NPCState.QUESTION:
		if (!textbox_created) {
            // create textbox and set its dialog
            var textbox = instance_create_layer(x, y, "GUI", obj_textbox);
			textbox.text = [];
            textbox.text[0] = "Well anyway... Take this and bring it back when you figure it out."
			textbox_created = true;
        } else {
            show_indicator = false;
        }

        // transition to next state after textbox is destroyed
        if (textbox_created && !instance_exists(obj_textbox)) {
            state = NPCState.MISSION_SENT;
        }
        break;

    case NPCState.MISSION_SENT:
        // Spawn obj_puzzle_1 in the center of the screen
        if (!instance_exists(obj_puzzle_1)) {
            var puzzle_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2;
            var puzzle_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2;
            instance_create_layer(puzzle_x, puzzle_y, "StaffLayer", obj_puzzle_1);
			global.puzzle_active = true;
        }

        // Transition to the next state when the puzzle is complete
        if (global.puzzle_1_complete) {
            state = NPCState.MISSION_RECEIVED;
        }
        break;

    case NPCState.MISSION_RECEIVED:
        // You can add any logic here for post-puzzle state, such as rewarding the player
        show_indicator = false;
        break;
}


// set font settings repeatedly
draw_set_font(fnt_body);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);