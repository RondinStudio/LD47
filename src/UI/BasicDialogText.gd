extends Control

var pitchoune = preload("res://assets/graphisme/Pitchoune buste.png")
var pitchoune_triste = preload("res://assets/graphisme/Pitchoune triste buste.png")

var fini = false
var peutContinuer = false
onready var tie = get_node("Panel/text_interface_engine")
var ordrePersos = ["Ekip", "Gangster", "Ekip"]
var ordrePhrase = ["Ehhui ça fait du sale ou bien des trucs enfin tu connais ou quoi que c'est qui se passe peut et ?",\
"Ah ouais Morray askip tu fais du sale",\
"Ahah bien sûr tu connais negro"]
var ordreSprite = [pitchoune, pitchoune_triste, pitchoune]

var i = 0

func _ready():
	tie.connect("input_enter", self, "_on_input_enter")
	tie.connect("buff_end", self, "_on_buff_end")
	tie.connect("state_change", self, "_on_state_change")
	tie.connect("enter_break", self, "_on_enter_break")
	tie.connect("resume_break", self, "_on_resume_break")
	tie.connect("tag_buff", self, "_on_tag_buff")
	
	_on_buff_end()
	
	tie.set_state(tie.STATE_OUTPUT)

func _physics_process(delta):
	if peutContinuer == true and fini == false:
		if Input.is_action_pressed("space"):
			fini = true
			print("ekip ekip")
			next_level()
		
func next_level():
	print("slt c fini")

func change_name():
	$PanelText/Label.text = ordrePersos[i] 

func change_sprite():
	$Sprite.texture = ordreSprite[i]

func _on_input_enter(s):
	print("Input Enter ",s)

func _on_buff_end():
	if i < ordrePhrase.size():
		change_name()
		change_sprite()
		tie.buff_text(ordrePhrase[i], 0.05)
		tie.buff_silence(1.5)
		tie.buff_clear()
		i += 1
		tie.set_state(tie.STATE_OUTPUT)
	if i == ordrePhrase.size():
		tie.buff_text(ordrePhrase[ordrePhrase.size()-1], 0)
		tie.buff_silence(10000000)
		$Panel/Label.text = "Press space to continue"
		peutContinuer = true

func _on_state_change(i):
	print("New state: ", i)

func _on_enter_break():
	print("Enter Break")

func _on_resume_break():
	print("Resume Break")

func _on_tag_buff(s):
	print("Tag Buff ",s)
