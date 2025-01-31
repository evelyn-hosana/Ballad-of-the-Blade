if (in_range) {
	// scale world coordinates to GUI coordinates
    var camera_width = camera_get_view_width(view_camera[0]);
    var camera_height = camera_get_view_height(view_camera[0]);
    var viewport_width = display_get_gui_width();
    var viewport_height = display_get_gui_height();

    var scale_x = viewport_width / camera_width;
    var scale_y = viewport_height / camera_height;

    // convert world position to screen-space
    var screen_x = (x - camera_get_view_x(view_camera[0])) * scale_x;
    var screen_y = (y - camera_get_view_y(view_camera[0])) * scale_y;

    // text setup
    var indicator_text = "Press E to interact";
    var text_width = string_width(indicator_text);
    var text_height = string_height(indicator_text);

    // adjusting position above signpost sprite
    var sprite_half_height = sprite_get_height(sprite_index) / 2;
    var indicator_x = screen_x;
    var indicator_y = screen_y - (sprite_half_height * scale_y) - text_height - 10;

    // draw background box behind text
    var padding = 4;
    draw_set_color(c_black);
    draw_set_alpha(0.7);
    draw_rectangle(indicator_x - text_width / 2 - padding, 
                   indicator_y - text_height / 2 - padding, 
                   indicator_x + text_width / 2 + padding, 
                   indicator_y + text_height / 2 + padding, false);

    // draw text centered
    draw_set_color(c_white);
	draw_set_font(global.font);
    draw_set_alpha(1);
    draw_text(indicator_x - text_width / 2, indicator_y - text_height / 2, indicator_text);
}