extends Control

var actual_background

var nightclub1 = preload("res://assets/graphisme/histoire/nightclub 1.png")
var nightclub2 = preload("res://assets/graphisme/histoire/nightclub 2.png")
var nightclub3 = preload("res://assets/graphisme/histoire/nightclub 3.png")
var actual_nightclub = 1

var dark_alley = preload("res://assets/graphisme/histoire/Fond vaisseau.png")
var spaceship = preload("res://assets/graphisme/histoire/Fond vaisseau.png")

var ordrePersos = [
	"Flynn",
	"Narrator",
	"Flynn",
	"Narrator",
	"Narrator",
	"Narrator",
	"Flynn",
	"Narrator",
	"MMA-0-TRA-K",
	"Flynn",
	"MMA-0-TRA-K",
	"Flynn",
	"MMA-0-TRA-K",
	"Narrator",
	"Flynn",
	"Flynn"
]

var ordrePhrase = [
	"Here we are. K2-1000. Wasn’t easy, but I did it !", \
	"*swoosh*, somtehing teleports into your ship", \
	"Let’s call this MMA-0-TRA-K.", \
	"Phone ringing...", \
	"Phone ringing...", \
	"Phone ringing...", \
	"This stupid piece of scrap won’t answer. Seems fishy...", \
	"Phone ringing...", \
	"Hello. I’m MMA-0-TRA-K, a diplomatic robot. How could I help you ?", \
	"Finally ! I delivered your package ! Now I want my \"many rewards\" !", \
	"Who are you ?", \
	"I’m Flynn ! You hired me !", \
	"I don’t have your name in my database, sorry. Have a nice day.", \
	"The robot hangs up", \
	"Fuck robots.", \
	"I think I have to sleep in my spaceship again. Could be a comfy house to live in if I had a bed."
]

var ordreSprite = [
	"pitchoune",
	"Narrator",
	"pitchoune",
	"Narrator",
	"Narrator",
	"Narrator",
	"pitchoune",
	"Narrator",
	"robot",
	"pitchoune_tel",
	"robot",
	"pitchoune_tel",
	"robot",
	"pitchoune_triste",
	"pitchoune_triste",
	"pitchoune_depite"
]

func _ready():
	Events.connect("change_background_fin_premier", self, "on_change_background")
	$ZoneDialog.init(ordrePhrase, ordrePersos, ordreSprite)

func on_change_background(name):
	$changementFond.stop()
	actual_background = name
	print(name)
	if name == "nightclub":
		$changementFond.start()
		actual_nightclub = 1
		$fond.texture = nightclub1
	if name == "dark_alley":
		$fond.texture = dark_alley
	if name == "spaceship":
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

