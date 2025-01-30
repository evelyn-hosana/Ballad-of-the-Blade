// Gate step event
if (gate_open) {
    // If the gate has just been triggered to open, start the animation
    if (image_speed == 0) {
        image_speed = .6;  // or whatever speed you want
    }
    
    // Check if the sprite has reached the final frame
    if (image_index >= image_number - 1) {
        // Stop the animation on the final (opened) frame
        image_index = image_number - 1;
        image_speed = 0;
        
        // Make the gate no longer block the player
        instance_change(obj_gate_passthrough, true);
    }
}