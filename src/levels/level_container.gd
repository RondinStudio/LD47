extends Node2D

var current_level = 1
	
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
