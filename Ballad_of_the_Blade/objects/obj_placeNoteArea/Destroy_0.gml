/// @description Destroy Created Objects

for (var i = 1; i <= 11; i++) { 
    if (instance_exists(snap[i])) {
        instance_destroy(snap[i]);
    }
}

snap = []; // free up array