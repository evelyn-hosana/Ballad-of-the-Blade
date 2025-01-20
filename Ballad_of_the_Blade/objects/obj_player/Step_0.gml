/// @description Player Movement Logic

// movement keys
var jump_key = keyboard_check(vk_up) || keyboard_check(ord("W"));
var left_key = keyboard_check(vk_left) || keyboard_check(ord("A"));
var right_key = keyboard_check(vk_right) || keyboard_check(ord("D"));

// check for ground
if (place_meeting(x, y+1, obj_solid_parent)) {
    vspd = 0; // Reset vertical speed
    if (jump_key) {
        vspd = -jspd; // Apply jump if active
    }
// apply gravity otherwise
} else {
	if (vspd < 10) {
		vspd += grav;
    }
}

// moving right
if (right_key) { hspd = spd; }
// moving left
if (left_key) { hspd = -spd; }
// check if not moving
if ((!right_key && !left_key) || (right_key && left_key)) { hspd = 0; }

// horizontal collision
if (place_meeting(x + hspd, y, obj_solid_parent)) {
    while (!place_meeting(x + sign(hspd), y, obj_solid_parent)) {
        x += sign(hspd);
    }
    hspd = 0;
}

// apply horizontal movement
x += hspd;

// vertical collision
if (place_meeting(x, y + vspd, obj_solid_parent)) {
    while (!place_meeting(x, y + sign(vspd), obj_solid_parent)) {
        y += sign(vspd);
    }
    vspd = 0;
}
// apply vertical movement
y += vspd;

//summon the sheet music
if (keyboard_check_pressed(vk_space)) {
	if (instance_number(obj_sheetMusic) == 0) {
	    var offset_x = 100;  // Adjust this value to place it in front of the player
		var offset_y = 0;   // Adjust if needed for vertical alignment
		var music = instance_create_layer(x + (image_xscale * offset_x), y + offset_y, "Instances", obj_sheetMusic);
		music.visible = true;
	}
}