//Draw Event
// Use the image_alpha for fading
draw_set_alpha(image_alpha);

// If we’re in the treble phase, draw the treble sprite at its normal size
if (phase == "treble") {
    draw_sprite(sprite_index, image_index, x, y);
} 
// Otherwise, we’re showing the staff, which may be stretched or scaled
else {
    draw_sprite_stretched(
        sprite_index, 
        image_index, 
        x, 
        y, 
        sheet_width, 
        sprite_get_height(sprite_index)
    );
}


// Reset alpha so other objects draw normally
draw_set_alpha(1);