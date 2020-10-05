extends Control

var ordrePersos = ["Narrator", "Narrator", "Flynn", "Margarita Sancheese", "Flynn", "Margarita Sancheese", "Flynn", \
"Narrator", "Flynn"]
var ordrePhrase = ["Here is the story of Flynn, a space trucker who is in dire need of money because he keeps losing everything when he earns some. You could say that he is stuck in poverty because of his curse ...",\
"Oh, the phone is ringing!",\
"Hello, X-Treme Truck Driving Service Flynn, how can I help you ?",\
"Hello I am Margarita Sancheese from Space Rabbit Pizza. We’ve heard that you’re broke. Wanna deliver some pizzas for us ?", \
"Sure, even if I’m used to more dangerous missions, bills won’t pay themselves.", \
"We knew that you would be the not-man for the job ! We’re gonna teleport the pizzas into your ship right now ! You’ll just have to deliver it a few planets away.", \
"Well, let's get going. Good bye M. Sancheese.", \
"As soon as Flynn hangs up, he hears the sound of the pizza getting teleported to his spaceship.", \
"Let's get this over with."]
var ordreSprite = ["Narrator", "Narrator", "pitchoune_tel", "sancheese", "pitchoune_depite", "sancheese", "pitchoune_tel",\
"Narrator", "pitchoune"]

func _ready():
	$ZoneDialog.init(ordrePhrase, ordrePersos, ordreSprite)
	Events.connect("next_level", self, "on_next_level") 

func on_next_level():
	get_tree().change_scene("res://src/levels/level_container.tscn")
