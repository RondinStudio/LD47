extends Control

var ordrePersos = ["Narrator", "Flynn", "Gaston Le Kraken", "Flynn", "Gaston Le Kraken", "Flynn", "Gaston Le Kraken", "Flynn", "Gaston Le Kraken", "Narrator"]
var ordrePhrase = ["The phone starts ringing", \
"Hello, X-Treme Epic Truck Delivery Service Flynn, how can I help you?", \
"Hey Flynn! It's Gaston The Kraken ! How you doin' ? Still EXTREME?!", \
"Gaston! It’s been a while!", \
"Yeah... Since that stupid delivery mission in the lost jungle of Hak-Hak-Hak. Remember? That's when I lost my fifth tentacle !", \
"That was the good old days...", \
"My spaceship is broken and I need to deliver a space four-wheeler to the prince Karim, you wish to join in ? Fifty/fifty, like the good old days.", \
"Deal. Just teleport into my ship and let's go !", \
"Here I come !", \
"Gaston teleports himself in Flynn's spaceship."]
var ordreSprite = ["Narrator", "pitchoune_tel", "gaston", "pitchoune_bourre_content", "gaston", "pitchoune_tel", \
"gaston", "pitchoune_tel", "gaston", "Narrator"]

func _ready():
	$ZoneDialog.init(ordrePhrase, ordrePersos, ordreSprite)

