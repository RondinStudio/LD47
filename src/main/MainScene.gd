extends Node2D

export (PackedScene) var etoile
export (int) var nb_etoile
var nb_actuel = 0

func _ready():
	randomize()
	
func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		on_pause_pressed()

func on_pause_pressed():
	get_tree().paused = true
	$pause_popup.show()

func on_resume():
	get_tree().paused = false
	$pause_popup.hide()

func _on_Timer_timeout():
	var x = randi()%1920
	var y = randi()%1080
	var new_etoile = etoile.instance()
	new_etoile.position.x = x
	new_etoile.position.y = y
	self.add_child(new_etoile)
	move_child(new_etoile, 1)
	nb_actuel += 1
	if (nb_actuel == nb_etoile):
		$Timer.stop()

