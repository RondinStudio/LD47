extends Node2D

export (PackedScene) var etoile
export (int) var nb_etoile
var nb_actuel = 0
var player

func _ready():
	Events.connect("player_death",self, "on_player_death")
	Events.connect("new_checkpoint", self, "on_new_checkpoint") 
	Events.connect("end_of_level_reached", self, "on_end_of_level_reached")
	randomize()
	player = $Spaceship

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

func on_new_checkpoint(planete):
	var direction_to_planet = planete.get_node("Pivot/OrbitPosition").global_position.direction_to(planete.global_position)
	$spawn_position.position = planete.get_node("Pivot/OrbitPosition").global_position + direction_to_planet * 20

func on_player_death():
	player.position = $spawn_position.position
	player.set_physics_process(true)
	print("zeubi t'es la?")

func on_end_of_level_reached():
	get_parent().go_to_next_level()
