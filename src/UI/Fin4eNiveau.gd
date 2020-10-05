extends Control

var ordrePersos = [
	"Narrator",
	"Marguarita Sancheese",
	"Flynn",
	"Marguarita Sancheese",
	"Flynn",
	"Narrator",
	"Flynn",
	"???",
	"Flynn",
	"Brigitte",
	"Flynn",
	"Brigitte",
	"Flynn",
	"Brigitte",
	"Flynn",
	"Brigitte",
	"Flynn",
	"Brigitte",
	"Flynn",
	"Brigitte",
	"Flynn"
]

var ordrePhrase = [
	"The phone starts ringing.", 
	"Just in time M.Flynn ! Now we're able to bake our delicious cement and anchory pizza !", 
	"Well that's wonderful. Now, time to speak about money.", 
	"Si, si... Here is your payment !", 
	"Thank you Margarita Sancheez, even if you probably don't have any taste bud, you're a man of honor !", 
	"A few minutes later, Flynn doesn't even have enough time to relax before the phone starts ringing again.", 
	"Hello, X-Treme Turbo Epic Giant Truck Delivery Service Flynn, how could I help you ?", 
	"Hello brother. Are you Flynn the one known as 'best truck driver in the whole galaxy' ?", 
	"In the flesh.", 
	"I am Brigitte, from the Kind Association of Flub the Beautiful.", 
	"The kind association of Flub the Beautiful... Mhh... OH ! That's the cult that goes from planets to planets trying to convert people to their cause !", 
	"Indeed. You and your friend Gaston The Kraken wrecked our temple a few days ago.", 
	"What ? I’m so sorry, I was totally drunk...", 
	"We noticed. You owe us 6 000 000 space dollars.", 
	"HOW MUCH ?", 
	"You owe us 6 000 000 space dollars.",
	"I... I don't have that much money !",
	"Give us everything you have and we'll see.",
	"Take it... It's not much, but it's all I have...",
	"That's clearly not enough. You have one month to repay us or you won't be able to repay anyone anymore.",
	"I'm in deeeep shit..."
]

var ordreSprite = [
	"Narrator",
	"sancheese",
	"pitchoune_tel",
	"sancheese",
	"pitchoune_tel",
	"Narrator",
	"pitchoune_tel",
	"Narrator",
	"pitchoune_sunglasses",
	"Narrator",
	"pitchoune_tel",
	"Narrator",
	"pitchoune_depite",
	"Narrator",
	"pitchoune_bourre_pas_content",
	"Narrator",
	"pitchoune_triste",
	"Narrator",
	"pitchoune_depite",
	"Narrator",
	"pitchoune_triste",
]

func _ready():
	$ZoneDialog.init(ordrePhrase, ordrePersos, ordreSprite)

