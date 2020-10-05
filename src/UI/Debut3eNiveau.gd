extends Control

var ordrePersos = [
	"Narrator", 
	"Flynn", 
	"MMA-0-TRA-K",
	"Flynn", 
	"MMA-0-TRA-K",
	"Narrator",
	"Flynn",
	"MMA-0-TRA-K"
]

var ordrePhrase = [
	"The phone starts ringing.", \
	"Hello, X-Treme Epic Truck Delivery Service Flynn, how can I help you ?", \
	"Hello. I’m MMA-0-TRA-K, a diplomatic robot. I serve an anonymous client. He wants you to deliver a special package to the dangerous planet K2-1000. Do you accept this highly hazardous mission, in exchange for many rewards ?", \
	"You've got my attention. I'm clearly the not-man you're looking for!", \
	"We will teleport the package into your ship right now. Good luck mister Flynn.", \
	"A package teleports into your ship", \
	"What the hell is that ? It just looks like... A marshmallow tree... ? ? ?", \
	"One rule : NO QUESTION. Go and deliver what you must."
]

var ordreSprite = [
	"Narrator", 
	"pitchoune_tel", 
	"robot",
	"pitchoune_tel", 
	"robot",
	"Narrator", 
	"pitchoune",
	"robot"
]

func _ready():
	$ZoneDialog.init(ordrePhrase, ordrePersos, ordreSprite)
	Events.connect("next_level", self, "on_next_level") 

func on_next_level():
	get_tree().change_scene("res://src/levels/level_container.tscn")

