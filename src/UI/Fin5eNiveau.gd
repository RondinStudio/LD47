extends Control

var ordrePersos = ["Narrator", "Flynn", "Space parrot", "Flynn", "Space parrot", "Narrator", "Flynn", "Narrator", \
"Flynn", "???", "Flynn", "???", "Flynn", "Rick The Red", "Narrator", "Flynn", "Flynn", "Rick The Red", \
"Narrator", "Flynn", "Narrator"]
var ordrePhrase = ["After a long travel, they finaly arrived to their destination.", \
"Here we are !", \
"Herrrre we arrrre !", \
"Just shup up.", \
"Landlubberrrr ! BWAAAAK !", \
"They hear the sound of a teleporter and they notice that the space parrot is gone.", \
"I never thought silence would been so delicious to my ears.", \
"The phone starts ringing.", \
"Hello, X-Treme Turbo Epic Giant Great Truck Delivery Service Flynn, how can I help you ?", \
"Give me my parrot back.", \
"What ? We just delivered it.", \
"You've stolen my parrot and i want it back RIGHT NOW !", \
"Who are you ?", \
"I AM RICK THE RED ! SHIVER BEFORE ME !", \
"Flynn sudenly remember the news, Rick The Red is the most famous and dangerous space pirate.", \
"Oh boi.", \
"I... I don't have your parrot anymore it just teleported.", \
"Ooho so you're trying to fuck with me. Alright. You'll pay with your own life.", \
"He hangs up.", \
"OH BOIII LETS FLEE SOMEWHERE HE WON'T FIND US !", \
"And that's how the story of Flynn, the most famous space trucker of the galaxy, ends. Nobody never heard about him anymore. Some says he's been hiding since, always struggling to get money because he keeps... somehow, losing it."]
var ordreSprite = ["Narrator", "pitchoune_bourre_content", "Narrator", "pitchoune_enerve", "Narrator", "Narrator", \
"pitchoune_bourre_content", "Narrator", "pitchoune_tel", "Narrator", "pitchoune", "Narrator", "pitchoune", \
"rick", "Narrator", "pitchoune_depite", "pitchoune_triste", "rick", "Narrator", "pitchoune_triste", "Narrator"]

func _ready():
	$ZoneDialog.init(ordrePhrase, ordrePersos, ordreSprite)
	Events.connect("next_level", self, "on_next_level") 

func on_next_level():
	get_tree().change_scene("res://src/UI/MainMenu.tscn")
	Globals.current_level = 1

