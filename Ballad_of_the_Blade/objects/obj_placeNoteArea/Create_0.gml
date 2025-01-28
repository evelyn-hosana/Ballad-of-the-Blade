/// @description Set Properties

if (room == rm_one) {
	image_xscale = 0.25;
	image_yscale = 0.63;
} else if (room == rm_intro) {
	image_xscale = 0.22;
	image_yscale = 0.32;
}

correct_key = noone;
correct = false;

active_note = noone;

snap = [];

// place snap objects & sounds
if (room != rm_intro) {
	snap[1] = instance_create_layer(x, y + 15, "StaffNotesLayer", obj_snapNoteToKey);
	snap[2] = instance_create_layer(x, y + 12, "StaffNotesLayer", obj_snapNoteToKey);
	snap[10] = instance_create_layer(x, y - 13, "StaffNotesLayer", obj_snapNoteToKey);
	snap[11] = instance_create_layer(x, y - 17, "StaffNotesLayer", obj_snapNoteToKey);

	snap[1].sound = snd_d;
	snap[2].sound = snd_e;
	snap[10].sound = snd_f_2;
	snap[11].sound = snd_g_2;
}
snap[3] = instance_create_layer(x, y + 9, "StaffNotesLayer", obj_snapNoteToKey);
snap[4] = instance_create_layer(x, y + 6, "StaffNotesLayer", obj_snapNoteToKey);
snap[5] = instance_create_layer(x, y + 3, "StaffNotesLayer", obj_snapNoteToKey);
snap[6] = instance_create_layer(x, y - 1, "StaffNotesLayer", obj_snapNoteToKey);
snap[7] = instance_create_layer(x, y - 4, "StaffNotesLayer", obj_snapNoteToKey);
snap[8] = instance_create_layer(x, y - 7, "StaffNotesLayer", obj_snapNoteToKey);
snap[9] = instance_create_layer(x, y - 10, "StaffNotesLayer", obj_snapNoteToKey);

snap[3].sound = snd_f;
snap[4].sound = snd_g;
snap[5].sound = snd_a;
snap[6].sound = snd_b;
snap[7].sound = snd_c;
snap[8].sound = snd_d_2;
snap[9].sound = snd_e_2;