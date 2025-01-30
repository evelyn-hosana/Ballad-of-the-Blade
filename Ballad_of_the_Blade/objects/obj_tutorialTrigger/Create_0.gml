// obj_tutorialTrigger: Create Event
text = [
    "How did you end up in this realm? ...are you even human? Press Enter to read the page.",
	"I'll have to teach you how to control yourself. Use WASD to move and press E to interact with objects.",
	"I wonder what that sign says over there..."
];
var textbox = instance_create_layer(x, y, "Player", obj_textbox);
textbox.text = text;
// (No need to wait for E, it just pops up right away)