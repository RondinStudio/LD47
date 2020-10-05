extends Control

var ordrePersos = ["Narrator", "Flynn", "Gaston The Kraken", "Flynn", "Gaston The Kraken", "Flynn", "Gaston The Kraken", "Flynn", "Gaston The Kraken", "Narrator"]
var ordrePhrase = ["The phone starts ringing", \
"Hello, X-Treme Epic Truck Delivery Service Flynn, how could I help you ?", \
"Hey Flynn it's Gaston The Kraken ! How are you ? Still EXTREME ?!", \
"Gaston ! It’s been a while !", \
"Yeah... Since that stupide delivery mission in the lost jungle of Hak-Hak-Hak. Remember ? I've lost my fifth tentacule here !", \
"That was the good old days...", \
"I've broken my spaceship, I need to deliver a space four-wheeler to the prince Karim, do you want to participate ? Fifty/fifty, like the good old days.", \
"Deal. Just teleport into my ship and let's go !", \
"Here I come !", \
"Gaston teleports himself in Flynn's spaceship."]
var ordreSprite = ["Narrator", "pitchoune_tel", "gaston", "pitchoune_bourre_content", "gaston", "pitchoune_tel", \
"gaston", "pitchoune_tel", "gaston", "Narrator"]

func _ready():
	$ZoneDialog.init(ordrePhrase, ordrePersos, ordreSprite)
	Events.connect("next_level", self, "on_next_level") 

func on_next_level():
	get_tree().change_scene("res://src/levels/level_container.tscn")

