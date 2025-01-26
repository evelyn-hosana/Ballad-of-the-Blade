// obj_sheetMusicNotesPlatform: Step Event
var p = instance_nearest(x, y, obj_player);
if (instance_exists(p)) {

    // 1) Horizontal overlap
    var player_left   = p.x + p.bbox_left;
    var player_right  = p.x + p.bbox_right;
    var plat_left     = x + bbox_left;
    var plat_right    = x + bbox_right;
    
    var horizontalOverlap = (player_right > plat_left && player_left < plat_right);

    // 2) Vertical check: player's bottom near platform's top
    var player_bottom = p.y + p.bbox_bottom;
    var plat_top      = y + bbox_top;
    
    // 3) Is the player moving downward?
    if (horizontalOverlap && (player_bottom <= plat_top + 2) && (p.vspd > 0)) 
    {
        // The player is basically on top
        if (!alreadyPlayed) {
            audio_play_sound(mySound, 1, false);
            alreadyPlayed = true;
            show_debug_message("Playing note: " + string(mySound));
        }
    } 
    else 
    {
        alreadyPlayed = false;
    }
}