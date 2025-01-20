//Draw Event
// Draw the expanded sheet music using its updated width
draw_sprite_stretched(spr_sheetMusic, 0, x, y, sheet_width, sprite_get_height(spr_sheetMusic));

// Draw the notes on the expanded sheet music
for (var i = 0; i < array_length(notes); i++) {
    draw_circle_color(x + notes[i][0], y + notes[i][1], 5, c_black, c_black, false);
}