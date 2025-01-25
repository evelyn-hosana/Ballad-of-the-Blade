// obj_signpost: Step or Key Press Event
if (keyboard_check_pressed(ord("E"))) {
    var interaction_distance = 64;
    var player = instance_nearest(x, y, obj_player);
    if (player != noone && point_distance(x, y, player.x, player.y) <= interaction_distance) {
        var textbox = instance_create_layer(x, y, "Player", obj_textbox);
        
        // pass this signpost's text to the textbox
        textbox.text = text; 
        // Or copy if you prefer: textbox.text = array_copy(text);
    }
}