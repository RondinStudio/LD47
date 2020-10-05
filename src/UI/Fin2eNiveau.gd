extends Control

var actual_background

var nightclub1 = preload("res://assets/graphisme/histoire/nightclub 1.png")
var nightclub2 = preload("res://assets/graphisme/histoire/nightclub 2.png")
var nightclub3 = preload("res://assets/graphisme/histoire/nightclub 3.png")
var actual_nightclub = 1

var dark_alley = preload("res://assets/graphisme/histoire/Fond vaisseau.png")
var spaceship = preload("res://assets/graphisme/histoire/Fond vaisseau.png")

var ordrePersos = ["Gaston Le Kraken", "Flynn", "nightclub", "Flynn", "Gaston Le Kraken", "Flynn", "Gaston Le Kraken", "Flynn", "Gaston Le Kraken", \
"Flynn", "Flynn", "spaceship", "Flynn", "Frog", "Flynn", "Frog", "Flynn", "Narrator", "Flynn"]
var ordrePhrase = ["Wow, that was a bit more stressful than I expected. Wanna relax at The Groovy Groove like we used to do ?", \
"There's no better nightclub than The Groovy Groove in the universe. LET'S GO !", \
"They head towards the Groovy Groove and they start drinking... a LOT", \
"Heeeeey ! Gaston ! THIS PARTY IS INSANE !", \
"Yeah ! Guess what ? I found my lost tentacle !", \
"What? How?", \
"And look at what I found with it! DRY JELLYFISH POWDER !", \
"I don’t touch that anymore, you know ?", \
"Just one, in memory of the good old days !", \
"...", \
"Just one, in memory of the good old days...", \
"Flynn wakes up several hours later, laying in his spaceship", \
"Outch... My head... Where I am ? And... Where are my pants ?", \
"Ribbit.", \
"What the hell are you doing here ?", \
"Ribbit.", \
"Shit. Where is Gaston ? And where is my money ? I don’t remember anything...", \
"Flynn sighs.", \
"Pfff... Like the good old days... Once again, I need a job..."]
var ordreSprite = ["gaston", "pitchoune_bourre_content", "Narrator", "pitchoune_bourre_content", "gaston", "pitchoune_depite", "gaston", "pitchoune", \
"gaston", "pitchoune", "pitchoune_sunglasses", "Narrator", "pitchoune_bourre_pas_content", "frog", \
"pitchoune_enerve", "frog", "pitchoune_depite", "Narrator", "pitchoune_triste"]

func _ready():
	Events.connect("change_background_fin_premier", self, "on_change_background")
	$ZoneDialog.init(ordrePhrase, ordrePersos, ordreSprite)
	Events.connect("next_level", self, "on_next_level") 

func on_next_level():
	get_tree().change_scene("res://src/UI/Debut3eNiveau.tscn")

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

