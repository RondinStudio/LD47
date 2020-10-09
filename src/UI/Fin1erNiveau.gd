extends Control

var actual_background

var nightclub1 = preload("res://assets/graphisme/histoire/nightclub 1.png")
var nightclub2 = preload("res://assets/graphisme/histoire/nightclub 2.png")
var nightclub3 = preload("res://assets/graphisme/histoire/nightclub 3.png")
var actual_nightclub = 1

var dark_alley = preload("res://assets/graphisme/histoire/Dark back Alley.png")
var spaceship = preload("res://assets/graphisme/histoire/Fond vaisseau.png")

var ordrePersos = ["Narrator", "Margarita Sancheese", "Flynn", "Flynn", "nightclub", "Sleazy guy", \
"Flynn", "dark_alley", "Flynn", "Sleazy guy", "Narrator", "Sleazy guy", "Flynn", "Narrator", "Flynn"]
var ordrePhrase = ["The phone starts ringing.", \
"You’ve done it perfecto ! Here’s your money !", \
"That's what I wanted to hear.", \
"Ok, now it is time to have some fun. Nothing is worth more than a delicious Coconut milk from my favorite nightclub The Groovy Grove !", \
"Therefore, Flynn headed to the nightclub.", \
"Hey buddy, you seem to be a very cool guy. I'll pay you the next one !", \
"Indeed, I’m the coolest space trucker you could see in the whole galaxy. Thanks for the drink, I owe you one !", \
"At the end of the night, Flynn was really drunk and followed the sleazy guy in a dark alley.", \
"I don’t like the way this dark alley looks like man... It seems very... Dark...", \
"Don’t worry everything will be fine...", "He draws a blaster", "IF YOU GIVE ME ALL YOUR MONEY !", \
"PLEASE DON’T KILL ME !! I’LL GIVE YOU EVERYTHING I HAVE... PLEASE !", \
"And once again, Flynn is poor... He really is stuck in poverty", \
"Back to the start... No money, no jobs, just me and my good old spaceship..."]
var ordreSprite = ["Narrator", "sancheese", "pitchoune_tel", "pitchoune_bourre_content", "Narrator", "mec_louche", \
"pitchoune_sunglasses", "Narrator", "pitchoune_bourre_pas_content", "mec_louche", "Narrator", "mec_louche_pas_content", \
"pitchoune_triste", "Narrator", "pitchoune_enerve"]

func _ready():
	Events.connect("change_background_fin_premier", self, "on_change_background")
	$ZoneDialog.init(ordrePhrase, ordrePersos, ordreSprite)
	Events.connect("next_level", self, "on_next_level") 
	SoundManager.play_bgm("res://assets/son/Musics/vaisseau-_loop_.ogg", 0.0, -81, -1, SoundManager.get_playing_sounds()[0]) # Play spaceship music

func on_next_level():
	get_tree().change_scene("res://src/UI/Debut2eNiveau.tscn")

func on_change_background(name):
	$changementFond.stop()
	actual_background = name
	print(name)
	if name == "nightclub":
		SoundManager.preload_resource(load("res://assets/son/Musics/Sons_LD47_club.ogg"))
		SoundManager.play_bgm("res://assets/son/Musics/Sons_LD47_club.ogg", 0.0, -81, -1, SoundManager.get_playing_sounds()[0]) # Play nightclub music
		$changementFond.start()
		actual_nightclub = 1
		$fond.texture = nightclub1
	if name == "dark_alley":
		SoundManager.preload_resource(load("res://assets/son/Musics/Ruelle.ogg"))
		SoundManager.play_bgm("res://assets/son/Musics/Ruelle.ogg", 0.0, -81, -1, SoundManager.get_playing_sounds()[0]) # Play dark alley music
		$fond.texture = dark_alley
	if name == "spaceship":
		SoundManager.preload_resource(load("res://assets/son/Musics/vaisseau-_loop_.ogg"))
		SoundManager.play_bgm("res://assets/son/Musics/vaisseau-_loop_.ogg", 0.0, -81, -1, SoundManager.get_playing_sounds()[0]) # Play spaceship music
		$fond.texture = spaceship

func _on_changementFond_timeout():
	if actual_nightclub == 1:
		$fond.texture = nightclub1
	if actual_nightclub == 2:
		$fond.texture = nightclub2
	if actual_nightclub == 3:
		$fond.texture = nightclub3
	var temp = actual_nightclub
	if temp == 1:
		actual_nightclub = 2
	if temp == 2:
		actual_nightclub = 3
	if temp == 3:
		actual_nightclub = 1

