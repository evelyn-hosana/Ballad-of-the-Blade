// obj_tutorialTrigger: Create Event
text = [
    "Welcome to the tutorial! Press Enter to read the page.",
	"Use WASD to move and press E to interact with objects!",
	"I wonder what that sign says over there..."
];
var textbox = instance_create_layer(x, y, "Player", obj_textbox);
textbox.text = text;
// (No need to wait for E, it just pops up right away)