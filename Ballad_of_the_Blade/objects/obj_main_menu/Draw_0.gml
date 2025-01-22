/// @description Draw "Play" Text

// draw rounded rectangle behind text
var rect_width = 375;
var rect_height = 55;
var rect_x = (display_get_width() / 2) - (rect_width / 2);
var rect_y = display_get_height() - 100;
draw_set_color(make_color_rgb(107, 35, 41));
draw_roundrect(rect_x, rect_y, rect_x + rect_width, rect_y + rect_height, false);

// fade effect for text
fade_alpha += fade_speed * fade_direction;
if (fade_alpha >= 1) fade_direction = -1; // start fading out
if (fade_alpha <= 0) fade_direction = 1; // start fading in again

// set alpha for text
draw_set_alpha(fade_alpha);

// set text properties and draw text
draw_set_font(fnt_title);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(make_color_rgb(249, 207, 145));
draw_text(display_get_width() / 2, rect_y + rect_height / 2 + 5, "Press 'Enter' to Play.");

// reset alpha
draw_set_alpha(1);