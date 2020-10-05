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
	"Hello, X-Treme Epic Truck Delivery Service Flynn, how could I help you ?", \
	"Hello. I’m MMA-0-TRA-K, a diplomatic robot. I serve an anonymous client. He wants you to deliver a special package to the dangerous planet K2-1000. Do you accept this highly risky mission, in exchange for many rewards ?", \
	"Don’t say it twice. I’m the not-man you’re looking for !", \
	"We will teleport the package into your ship right now. Good luck mister Flynn.", \
	"A package teleports into your ship", \
	"What’s the hell is that ? It looks like... A marshmallow tree...", \
	"First rule, no question, just deliver. Let’s go."
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

