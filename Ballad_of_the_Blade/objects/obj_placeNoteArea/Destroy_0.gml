/// @description Destroy Created Objects

if (room == rm_one) {
	for (var i = 1; i <= 11; i++) { 
	    if (instance_exists(snap[i])) {
	        instance_destroy(snap[i]);
	    }
	}
} else if (room == rm_intro) {
	for (var i = 1; i <= 3; i++) { 
	    if (instance_exists(snap[i])) {
	        instance_destroy(snap[i]);
	    }
	}
}

snap = []; // free up array