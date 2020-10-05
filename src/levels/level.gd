extends Node2D

export (PackedScene) var etoile
export (int) var nb_etoile
var nb_actuel = 0
var player

func _ready():
# warning-ignore:return_value_discarded
	Events.connect("player_death",self, "on_player_death")
# warning-ignore:return_value_discarded
	Events.connect("new_checkpoint", self, "on_new_checkpoint") 
# warning-ignore:return_value_discarded
	Events.connect("end_of_level_reached", self, "on_end_of_level_reached")
	randomize()
	player = $Spaceship

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

func on_new_checkpoint(new_spawn_pos):
	$spawn_position.position = new_spawn_pos
	get_parent().get_node("Camera2D").current = true

func on_player_death():
	player.position = $spawn_position.position
	player.set_physics_process(true)
	print("zeubi t'es la?")

func on_end_of_level_reached():
	get_parent().go_to_next_level()
