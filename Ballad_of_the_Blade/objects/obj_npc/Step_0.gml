/// @description Spawn Text Box When Interacted With

if (instance_exists(obj_player)) {
	var player = instance_nearest(x, y, obj_player);
	if (point_distance(x, y, player.x, player.y) <= range) {
		in_range = true;
	} else {
		in_range = false;
	}
}

// state management
switch (state) {
    case NPCState.INTRO:
        if (!textbox_created) {
            if (in_range && keyboard_check_pressed(ord("E"))) {
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

        // transition to next state after textbox is destroyed
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
			if (in_range && keyboard_check_pressed(ord("E"))) {
	            // create textbox and set its dialog
	            var textbox = instance_create_layer(x, y, "GUI", obj_textbox);
				textbox.text = [];
	            textbox.text[0] = "Well anyway... Take this and bring it back when you figure it out."
				textbox_created = true;
			}
			show_indicator = true;
        } else {
            show_indicator = false;
        }

        // transition to next state after textbox is destroyed
        if (textbox_created && !instance_exists(obj_textbox)) {
			textbox_created = false; // reset flag
            state = NPCState.MISSION_SENT;
        }
        break;

    case NPCState.MISSION_SENT:
        // spawn puzzle in the center of the screen
        if (!instance_exists(obj_puzzle_1)) {
            var puzzle_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2;
            var puzzle_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2;
            instance_create_layer(puzzle_x, puzzle_y, "StaffLayer", obj_puzzle_1);
			global.puzzle_active = true;
			show_debug_message("MISSION_SENT state reached. Creating puzzle now...");
        }

        // transition to next state when puzzle is complete
        if (global.puzzle_1_complete) {
            state = NPCState.MISSION_RECEIVED;
        }
        break;

    case NPCState.MISSION_RECEIVED:
         if (!textbox_created) {
            if (in_range && keyboard_check_pressed(ord("E"))) {
                // create textbox and set its dialog
                var textbox = instance_create_layer(x, y, "GUI", obj_textbox);
				textbox.text = [];
                textbox.text[0] = "Wow, I'm so glad you were able to figure it out! This really takes me back...";
                textbox.text[1] = "As promised, I'll tell you a secret ability your violin sword can do.";
				textbox.text[2] = "Your journey is trecherous, and sometimes the path isn't always accessible";
				textbox.text[3] = "If you press 'SPACE,' it'll bring up sheet music to place notes on.";
				textbox.text[4] = "Use 'Left Click' to place notes like before and press 'SPACE' again once you're done";
				textbox.text[5] = "We'll be able to use the notes as a platform!";
				textbox.text[6] = "Now, I'll be right behind you. Let's get out of this tree!";
				textbox_created = true;
            }
            show_indicator = true;
        } else {
            show_indicator = false;
        }

        // transition to next state after textbox is destroyed
        if (textbox_created && !instance_exists(obj_textbox)) {
			textbox_created = false; // reset flag
            state = NPCState.FOLLOW;
        }
        break;
		
	case NPCState.FOLLOW:
		var player = instance_nearest(x, y, obj_player);
		var target_x = player.x;
		var target_y = player.y;

		var dir = point_direction(x, y, target_x, target_y);
		
		ground_level = 1040;
		
		// if not on ground level
		if (bbox_bottom < ground_level) {
			if (point_distance(x, y, target_x, target_y) > dist) {
				x += lengthdir_x(4, dir);
			    y += lengthdir_y(4, dir);
			}
			
			// update sprite based on movement direction
	        if (x < target_x) { // moving right
	            if (image_index < 0 || image_index > 7) {
                    image_index = 0; // ensure loop within 0-7
                }
	        } 
	        else if (x > target_x) { // moving left
	            if (image_index < 8 || image_index > 15) {
                    image_index = 8; // ensure loop within 8-15
                }
	        }
		} else {
			show_debug_message("On ground!");
			vspd = 0;
			hspd = 0;
			state = NPCState.FINAL_THOUGHTS;	
		}
		
		if (hspd == 0) {
	        if (last_xdir > 0) {
                if (image_index < 16 || image_index > 19) {
                    image_index = 16; // ensure loop within 16-19 (idle right)
                }
            } else {
                if (image_index < 20 || image_index > 23) {
                    image_index = 20; // ensure loop within 20-23 (idle left)
                }
            }
	    }
		break;
		
	case NPCState.FINAL_THOUGHTS:
		if (!textbox_created) {
			if (in_range && keyboard_check_pressed(ord("E"))) {
	            // create textbox and set its dialog
	            var textbox = instance_create_layer(x, y, "GUI", obj_textbox);
				textbox.text = [];
	            textbox.text[0] = "Thanks a bunch! I heard rumors of distrubances happening to the right of here. Good luck! I'll be leaving now."
				textbox_created = true;
			}
			 show_indicator = true;
        } else {
            show_indicator = false;
        }

        // transition to next state after textbox is destroyed
        if (textbox_created && !instance_exists(obj_textbox)) {
            state = NPCState.EXIT;
        }
		break;
		
	case NPCState.EXIT:
		var target_x = 2000;
		var target_y = 1025;

		var dir = point_direction(x, y, target_x, target_y);
		
		x += lengthdir_x(4, dir);
		y += lengthdir_y(4, dir);
		
		image_index = 0;
		
		break;
}


//-------------------------------------------------------------
// VERTICAL COLLISION CHECK
//-------------------------------------------------------------
var newY = y + vspd
if (!place_meeting(x, newY, obj_invisiblesolid) || !place_meeting(x, newY, obj_sheetMusicNotesPlatform)) {
	y = newY;
} else {
	// If it would collide, move until just before collision
	var verticalDir = sign(vspd);
	while (!place_meeting(x, y + verticalDir, obj_solid_parent)) {
		y += verticalDir;
	}
	// Stop vertical speed
	vspd = 0;
}

//-------------------------------------------------------------
// HORIZONTAL COLLISION CHECK
//-------------------------------------------------------------
var newX = x + hspd;

// If moving horizontally won’t collide, just move
if (!place_meeting(newX, y, obj_solid_parent)) {
	x = newX;
} else {
	// If it would collide, move until just before collision
	var horizontalDir = sign(hspd);
	while (!place_meeting(x + horizontalDir, y, obj_solid_parent)) {
		x += horizontalDir;
	}
	// Stop horizontal speed
	hspd = 0;
}

if (hspd != 0) {
	last_xdir = sign(hspd); // -1 (left) or 1 (right)	
}

if (state != NPCState.FOLLOW && state != NPCState.EXIT) {
    // set idle animation based on last movement direction
    if (last_xdir > 0) { // last movement was right
        if (image_index < 16 || image_index > 19) {
            image_index = 16; // loop within idle right (16-19)
        }
    } else { // last movement was left
        if (image_index < 20 || image_index > 23) {
            image_index = 20; // loop within idle left (20-23)
        }
    }
}

// set font settings repeatedly
draw_set_font(fnt_body);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);