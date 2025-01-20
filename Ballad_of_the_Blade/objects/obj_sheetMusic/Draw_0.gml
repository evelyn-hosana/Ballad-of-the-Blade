draw_self();  // Draw the staff

// Draw the notes
for (var i = 0; i < array_length(notes); i++) {
    draw_circle_color(x + notes[i][0], y + notes[i][1], 5, c_black, c_black, false);
}