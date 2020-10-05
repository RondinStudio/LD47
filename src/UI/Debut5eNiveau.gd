extends Control

var ordrePersos = ["Narrator", "Flynn", "Gaston Le Kraken", "Flynn", "Gaston Le Kraken", "Flynn", "???", "Flynn", "Gaston Le Kraken", "Space parrot", \
"Flynn", "Gaston Le Kraken", "Flynn", "Gaston Le Kraken", "Flynn", "Gaston Le Kraken", "Space parrot", "Flynn", "Space parrot", "Flynn"]
var ordrePhrase = ["For a few weeks, Flynn has been trying his best to accumulate as much money as he could. Unfortunately he kept losing it, as he always did... A few days ago, Gaston contacted him and they talked about a way to get 6 000 000 space dollars really quickly.", \
"Are you sure we have to come here ?", \
"Are you sure you want your money ? I asked if you were ready to do anything.", \
"Yeah of course, but this place kind of revives a bad memory...", \
"Who cares... All we have to care about is that the package is supposed to be here.", \
"Fine...", \
"BWAAAAAAAAAK !", \
"WHAT WAS THAT ?!", \
"The package.", \
"BWAK ! I'll tearrrr you aparrrrt !", \
"A space parrot ?", \
"The client wants it delivered to the Bagu system, alive.", \
"But... That's literally the most dangerous system in the universe, how are we supposed to deliver that thing without risking our lives?", \
"Yeah I know, but I thought you were the best space trucker, I must've made a mistake!", \
"It suits the best to know when a mission is doomed to fail.", \
"Just think about the money, if we don't do it, we're DEAD.", \
"The trrrreasurrrre is nearrrr ! BWAK !", \
"Does he, at least, stop speaking sometimes ?", \
"Bilge barrrrel !", \
"Alright... Let's get back to the ship, and don't you dare put guano everywhere am I clear?"]
var ordreSprite = ["Narrator", "pitchoune", "gaston", "pitchoune_triste", "gaston", "pitchoune", "Narrator", "pitchoune_bourre_pas_content", \
"gaston", "perroquet", "pitchoune", "gaston", "pitchoune", "gaston", "pitchoune_depite", "gaston", "perroquet", \
"pitchoune_enerve", "perroquet", "pitchoune_enerve"]

func _ready():
	$ZoneDialog.init(ordrePhrase, ordrePersos, ordreSprite)
	Events.connect("next_level", self, "on_next_level") 

func on_next_level():
	get_tree().change_scene("res://src/levels/level_container.tscn")

