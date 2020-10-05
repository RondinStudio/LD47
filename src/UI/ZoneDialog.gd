extends Control

var pitchoune = preload("res://assets/graphisme/histoire/FLYNN/Pitchoune.png")
var pitchoune_triste = preload("res://assets/graphisme/histoire/FLYNN/Pitchoune triste buste.png")
var pitchoune_bourre_content = preload("res://assets/graphisme/histoire/FLYNN/Pitchoune buste bourre content.png")
var pitchoune_bourre_pas_content = preload("res://assets/graphisme/histoire/FLYNN/Pitchoune buste bourre pas content.png")
var pitchoune_sunglasses = preload("res://assets/graphisme/histoire/FLYNN/Pitchoune buste sunglasses.png")
var pitchoune_tel = preload("res://assets/graphisme/histoire/FLYNN/Pitchoune buste tel.png")
var pitchoune_enerve = preload("res://assets/graphisme/histoire/FLYNN/Pitchoune enerve.png")
var pitchoune_depite = preload("res://assets/graphisme/histoire/FLYNN/Pitchoune triste dépité.png")
var sancheese = preload("res://assets/graphisme/histoire/Marguarita Sancheeze.png")
var mec_louche = preload("res://assets/graphisme/histoire/Glurb.png")
var mec_louche_pas_content = preload("res://assets/graphisme/histoire/Glurb pas content.png")
var gaston = preload("res://assets/graphisme/histoire/Gaston.png")
var robot = preload("res://assets/graphisme/histoire/robot.png")

var sprites_dir = {"pitchoune": pitchoune, "pitchoune_triste": pitchoune_triste, \
"pitchoune_bourre_content": pitchoune_bourre_content, "pitchoune_bourre_pas_content": pitchoune_bourre_pas_content,\
"pitchoune_sunglasses": pitchoune_sunglasses, "pitchoune_tel": pitchoune_tel, \
"pitchoune_enerve": pitchoune_enerve, "pitchoune_depite": pitchoune_depite, "sancheese": sancheese, \
"mec_louche": mec_louche, "mec_louche_pas_content": mec_louche_pas_content, "gaston": gaston, \
"robot": robot
 }

onready var tie = get_node("Panel/text_interface_engine")
var ordrePersos = []
var ordrePhrase = []
var ordreSprite = []

var page_fini = false
var current_page = 0
var number_of_pages

func init(liste_phrases: Array, liste_persos: Array, liste_sprites: Array):
	tie.reset()
	ordrePhrase = liste_phrases
	ordrePersos = liste_persos
	ordreSprite = liste_sprites
	number_of_pages = ordrePhrase.size()
	current_page = 0
	print_page()
	
func print_page():
	if ordrePersos[current_page] == "nightclub" or ordrePersos[current_page] == "dark_alley" or ordrePersos[current_page] == "spaceship":
		Events.emit_signal("change_background_fin_premier", ordrePersos[current_page])
		ordrePersos[current_page] = "Narrator"
	tie.buff_text(ordrePhrase[current_page], 0.05)
	change_name()
	change_sprite()
	tie.set_state(tie.STATE_OUTPUT)

func _on_space_pressed():
	if page_fini == true:
		page_fini = false
		if current_page < number_of_pages - 1:
			current_page += 1
			tie.reset()
			print_page()
		else:
			tie.reset()
			next_level()
	else:
		tie.set_turbomode(true)

func _ready():
	tie.connect("input_enter", self, "_on_input_enter")
	tie.connect("buff_end", self, "_on_buff_end")
	tie.connect("state_change", self, "_on_state_change")
	tie.connect("enter_break", self, "_on_enter_break")
	tie.connect("resume_break", self, "_on_resume_break")
	tie.connect("tag_buff", self, "_on_tag_buff")


func _physics_process(delta):
	if Input.is_action_just_pressed("space"):
		_on_space_pressed()

func next_level():
	Events.emit_signal("next_level")

func change_name():
	$nom.text = ordrePersos[current_page] 

func change_sprite():
	if ordreSprite[current_page] == "Narrator":
		get_parent().get_node("Sprite").texture = null
	else:
		get_parent().get_node("Sprite").texture = sprites_dir[ordreSprite[current_page]]

func _on_buff_end():
	page_fini = true
