extends Control

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
	"Something teleports into your ship", \
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
	"pitchoune_tel",
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
	"Narrator",
	"pitchoune_triste",
	"pitchoune_depite"
]

func _ready():
	$ZoneDialog.init(ordrePhrase, ordrePersos, ordreSprite)
	Events.connect("next_level", self, "on_next_level") 

func on_next_level():
	get_tree().change_scene("res://src/UI/Debut4eNiveau.tscn")

