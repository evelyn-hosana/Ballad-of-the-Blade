/// @description Player Movement Logic

// movement keys
var jump_key = keyboard_check(vk_up) || keyboard_check(ord("W"));
var left_key = keyboard_check(vk_left) || keyboard_check(ord("A"));
var right_key = keyboard_check(vk_right) || keyboard_check(ord("D"));

// check for ground
if (place_meeting(x, y+1, obj_block)) {
    vspd = 0; // reset vertical speed
    if (jump_key) {
        vspd = -jspd; // apply jump if active
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
if (place_meeting(x+hspd, y, obj_block)) {
    while (!place_meeting(x + sign(hspd), y, obj_block)) {
		x += sign(hspd);
	}
	hspd = 0;
}
// apply horizontal movement
x += hspd;

// vertical collision
if (place_meeting(x, y+vspd, obj_block)) {
    while (!place_meeting(x, y + sign(vspd), obj_block)) {
		y += sign(vspd);
	}
	vspd = 0;
}
// apply vertical movement
y += vspd;