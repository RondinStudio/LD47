extends Control

var ordrePersos = ["Narrator", "Flynn", "Margarita Sancheese", "Flynn", "Margarita Sancheese", "Flynn", "Margarita Sancheese", \
"Flynn", "Margarita Sancheese", "Flynn", "Margarita Sancheese", "Flynn", "Margarita Sancheese","Narrator", "Flynn", "Narrator", "Flynn", "Flynn"]

var ordrePhrase = ["Somewhere around Salmon-4 \nFlynn's phone rings.",\
"Hello, X-Treme Epic Giant Truck Delivery Service Flynn, and we ENJOY BEING PAID, how can I help you ?",\
"Hello, M.Flynn, it's Margarita Sancheese, we already worked together.",\
"I don't deliver pizzas anymore, way too boring for me sorry, have a nice day!", \
"Wait you fool! I'm not calling you to deliver pizzas!", \
"Then what kind of adventures await me ?", \
"I see you're orbiting around Salmon-4, this is where we get the best anchovies. Unfortunately our delivery man is sick, not putting his mask on finally caught him up.", \
"You're asking me to deliver your anchovies... ?", \
"Yes please, this is a legit emergency, we needed the fastest space truck driver we know, and it may well be you!", \
"Me ? The fastest ? nice.", \
"To be honest, the only other one available was Sluggy Sam, so...", \
"Oh I see. . . \nNevermind, you can count on me. You'll get your anchovies before noon, whenever noon may be where you are.", \
"Great! I'll have you my shipment teleported in your spaceship.", \
"He hangs up.", \
"Even pizzaiolo are talking like start-uppers nowadays...", \
"Something teleports into your ship.", \
"DAMN, THAT STINKS, where's my gas mask...", \
"Well, let's get going"]

var ordreSprite = ["Narrator", "pitchoune_tel", "sancheese", "pitchoune_tel", "sancheese", "pitchoune_bourre_content", "sancheese",\
"pitchoune_depite", "sancheese", "pitchoune_sunglasses", "sancheese", "pitchoune_triste", "sancheese", "Narrator", "pitchoune_depite", \
"Narrator", "pitchoune_bourre_pas_content", "pitchoune"]

func _ready():
	$ZoneDialog.init(ordrePhrase, ordrePersos, ordreSprite)
	Events.connect("next_level", self, "on_next_level") 
	SoundManager.preload_resource(load("res://assets/son/Musics/vaisseau-_loop_.ogg"))
	SoundManager.play_bgm("res://assets/son/Musics/vaisseau-_loop_.ogg", 0.0, -81, -1, SoundManager.get_playing_sounds()[0])

func on_next_level():
	get_tree().change_scene("res://src/levels/level_container.tscn")
