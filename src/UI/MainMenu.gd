extends Control

var etoile = load("res://assets/Star.tscn")
export (int) var nb_etoile
var nb_actuel = 0

func _ready():
	pass # Replace with function body.

func _on_Exit_pressed():
	get_tree().quit()

func _on_Start_pressed():
	get_tree().change_scene("res://src/UI/Debut1erNiveau.tscn")

func _on_Timer_timeout():
	var x = randi()%1920
	var y = randi()%1080
	var new_etoile = etoile.instance()
	new_etoile.position.x = x
	new_etoile.position.y = y
	self.add_child(new_etoile)
	move_child(new_etoile, 0)
	nb_actuel += 1
	if (nb_actuel == nb_etoile):
		$Timer.stop()
