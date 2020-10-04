extends Node2D

export (PackedScene) var etoile
export (int) var nb_etoile
var nb_actuel = 0
var player

func _ready():
	Events.connect("player_death",self, "on_player_death")
	Events.connect("new_checkpoint", self, "on_new_checkpoint") 
	randomize()
	player = Globals.player
	
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

func on_new_checkpoint(planete):
	$spawn_position.position.x = planete.position.x - planete.get_node("Gravity/attraction").shape.radius + 25
	$spawn_position.position.y = planete.position.y

func on_player_death():
	player.position = $spawn_position.position
