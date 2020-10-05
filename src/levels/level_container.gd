extends Node2D

var current_level_number = 1
onready var current_level_reference = $Test_lvl_4

func _ready():
	$Camera2D.init(current_level_reference.get_node("Spaceship")) 

#TODO : utiliser la fonction _event (_input je sais plus) à la place
# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		on_pause_pressed()

func on_pause_pressed():
	get_tree().paused = true
	$pause_popup.show()

func on_resume():
	get_tree().paused = false
	$pause_popup.hide()

func go_to_next_level():
	#go_to_level(current_level + 1)
	#level + 1
	pass
	
# A TERME : AJOUTER DES FONCTIONS POUR MANIPULER LA MUSIQUE
