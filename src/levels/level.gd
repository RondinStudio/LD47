extends Node2D

var etoile = load("res://assets/Star.tscn")
export (int) var nb_etoile
var nb_actuel = 0
var player

func _ready():
	Events.connect("reset",self, "on_reset")
# warning-ignore:return_value_discarded
	Events.connect("player_death",self, "on_player_death")
# warning-ignore:return_value_discarded
	Events.connect("new_checkpoint", self, "on_new_checkpoint") 
# warning-ignore:return_value_discarded
	Events.connect("end_of_level_reached", self, "on_end_of_level_reached")
	randomize()
	player = $Spaceship

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_up"):
		on_end_of_level_reached()

func _on_Timer_timeout():
	var x = randi()%8000
	var y = randi()%4000
	var new_etoile = etoile.instance()
	new_etoile.position.x = x
	new_etoile.position.y = y
	self.add_child(new_etoile)
	move_child(new_etoile, 1)
	nb_actuel += 1
	if (nb_actuel == nb_etoile):
		$Timer.stop()

func on_reset():
	player.position = $spawn_position.position

func on_new_checkpoint(new_spawn_pos):
	$spawn_position.position = new_spawn_pos
	get_parent().get_node("Camera2D").current = true

func on_player_death():
	player.position = $spawn_position.position
	player.set_physics_process(true)

func on_end_of_level_reached():
	Globals.current_level += 1
	if (Globals.current_level == 2):
		get_tree().change_scene("res://src/UI/Fin1erNiveau.tscn")
	if (Globals.current_level == 3):
		get_tree().change_scene("res://src/UI/Fin2eNiveau.tscn")
	if (Globals.current_level == 4):
		get_tree().change_scene("res://src/UI/Fin3eNiveau.tscn")
	if (Globals.current_level == 5):
		get_tree().change_scene("res://src/UI/Fin4eNiveau.tscn")
	if (Globals.current_level == 6):
		get_tree().change_scene("res://src/UI/Fin5eNiveau.tscn")
