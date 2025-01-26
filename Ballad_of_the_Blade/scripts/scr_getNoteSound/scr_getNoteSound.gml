// scr_getNoteSound
// This function takes a localY coordinate and returns the closest note's sound

function getNoteSound(localY)
{
    // Example: staff line positions from top to bottom (in local coords)
	var staffLines = [ 12, 25, 38, 51, 64, 77, 90 ];
    // Matching sound resources for each line
    var staffSounds = [ snd_c, snd_d, snd_e, snd_f, snd_g, snd_a, snd_b ];

    var nearestDist  = 99999;
    var nearestIndex = 0;

    for (var i = 0; i < array_length(staffLines); i++) {
        var dist = abs(localY - staffLines[i]);
        if (dist < nearestDist) {
            nearestDist  = dist;
            nearestIndex = i;
        }
    }

    return staffSounds[nearestIndex];
}