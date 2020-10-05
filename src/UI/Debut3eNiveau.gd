extends Control

var ordrePersos = [
	"Narrator", 
	"Flynn", 
	"Robot",
	"Flynn", 
	"Robot",
	"Narrator",
	"Flynn",
	"Flynn"
]

var ordrePhrase = [
	"The phone starts ringing", \
	"Hello, X-Treme Epic Truck Delivery Service Flynn, how could I help you ?", \
	"Hello. I’m MMA-0-TRA-K, a diplomatic robot. I serve an anonymous client. He wants you to deliver a special package to the dangerous planet K2-1000. Do you accept this highly risky mission, in exchange for many rewards ?", \
	"Don’t say it twice. I’m the not-man you’re looking for !", \
	"We will teleport the package into your ship right now. Good luck mister Flynn.", \
	"*swoosh*, a package arrives in your ship", \
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
	"pitchoune"
]

func _ready():
	$ZoneDialog.init(ordrePhrase, ordrePersos, ordreSprite)

