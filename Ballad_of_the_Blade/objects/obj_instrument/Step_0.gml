/// @description Follow Player and Idle Animate

offset += speed; // increment offset over time
anim = sin(offset) * amplitude;

if (instance_exists(player)) {
	// modify x position based on player's facing direction
    if (player.image_xscale > 0) {
        x = player.x + front_dist; // player facing right (+x)
    } else {
        x = player.x - front_dist; // player facing left (-x)
    }
	// follow player's y position with animation added
    y = player.y + anim;
}