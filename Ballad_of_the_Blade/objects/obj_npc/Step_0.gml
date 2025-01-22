/// @description Spawn Text Box When Interacted With

if (keyboard_check_pressed(ord("E"))) {
    // find nearest player to check distance
    var interaction_distance = 64;
    var player = instance_nearest(x, y, obj_player);

    if (player != noone && point_distance(x, y, player.x, player.y) <= interaction_distance) {
        // create instance of obj_textbox
        var textbox = instance_create_layer(x, y, "Player", obj_textbox);

        // set custom text for textbox instance
        textbox.text = [];
        textbox.text[0] = "Hey there!";
        textbox.text[1] = "I'm done talking.";

        // set page number and initialize text length
        textbox.page_number = array_length(textbox.text);
        textbox.text_length = [];
        for (var i = 0; i < textbox.page_number; i++) {
            textbox.text_length[i] = string_length(textbox.text[i]);
        }
    }
}