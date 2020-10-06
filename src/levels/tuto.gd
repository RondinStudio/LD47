extends Node2D

var etoile = load("res://assets/Star.tscn")
export (int) var nb_etoile
var nb_actuel = 0
var player
var limitLevelTop
var limitLevelRight
var limitLevelBottom
var limitLevelLeft

var rng = RandomNumberGenerator.new()
#Variable liées au tuto
enum Steps {BEGINNING, END, PRESS_SPACE, FIRST_JUMP, SECOND_JUMP_COLLISION, THIRD_JUMP_BH, LAST_WORDS}
var current_step = Steps.BEGINNING

onready var popup_ui = $CanvasLayer/PopUpUI

var first_popup_text = ["Press space to get moving.\nKeep space pressed to accelerate !"]
var second_popup_text = ["Once you're in orbit, you can propulse yourself forward by pressing space.\nTry aiming for the next planet ! (PS : You can de/zoom the camera by scrolling down/up)"]
var third_popup_text = ["Be careful of obstacles on your trajectory, the slightest contact with anything and you're back to the last checkpoint"]
var fourth_popup_text = ["Gas is expensive, so you'd better make use of the attractive field of blackholes to influence your trajectory !"]
var fifth_popup_text = ["Congratulations ! You got the gist of navigating around is space ! But be careful, there is a lot of other dangers awaiting ... I heard there's some mean spaceships patrolling the area and exploding supernovas in the vicinity ! Good luck !"]

func _ready():
	Events.connect("fin_niveau", self, "on_end_of_level_reached")
# warning-ignore:return_value_discarded
	Events.connect("reset",self, "on_reset")
# warning-ignore:return_value_discarded
	Events.connect("player_death",self, "on_player_death")
# warning-ignore:return_value_discarded
	Events.connect("new_checkpoint", self, "on_new_checkpoint") 
# warning-ignore:return_value_discarded
	Events.connect("end_of_level_reached", self, "on_end_of_level_reached")
# warning-ignore:return_value_discarded
	Events.connect("camera_reached_target", self, "on_camera_reached_target")
	$CanvasLayer/PopUpUI.connect("end_reached", self, "on_end_reached")
	
	randomize()
	
	player = $Spaceship
	
	limitLevelTop = $LevelLimits/Position2DTop.position
	limitLevelRight = $LevelLimits/Position2DRight.position
	limitLevelBottom = $LevelLimits/Position2DBottom.position
	limitLevelLeft = $LevelLimits/Position2DLeft.position

func _on_Timer_timeout():
	var x = rng.randi_range(-limitLevelLeft.x, limitLevelRight.x)
	var y = rng.randi_range(limitLevelTop.y, limitLevelBottom.y)
	var new_etoile = etoile.instance()
	new_etoile.position.x = x
	new_etoile.position.y = y
	self.add_child(new_etoile)
	move_child(new_etoile, 1)
	nb_actuel += 1
	if (nb_actuel == nb_etoile):
		$Timer.stop()

func on_reset():
	if player.orbited == false:
		player.position = $spawn_position.position

func on_new_checkpoint(new_spawn_pos):
	$spawn_position.position = new_spawn_pos
	get_parent().get_node("Camera2D").current = true

func on_player_death():
	var planete_pos = player.planete.position
	var deplacement_correctif = $spawn_position.position.direction_to(planete_pos) * 5
	player.set_physics_process(true)
	player.positionToFollow = player.lastPositionToFollow
	player.position = $spawn_position.position + deplacement_correctif
	Events.emit_signal("camera_turbo_mode")


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
		
#Méthodes tuto
func goto_next_step():
	if current_step == Steps.BEGINNING:
		popup_ui.init(first_popup_text)
		popup_ui.visible = true
		current_step = Steps.PRESS_SPACE
		
	elif current_step == Steps.PRESS_SPACE:
		popup_ui.init(second_popup_text)
		popup_ui.visible = true
		current_step = Steps.FIRST_JUMP
	
	elif current_step == Steps.FIRST_JUMP:
		popup_ui.init(third_popup_text)
		popup_ui.visible = true
		current_step = Steps.SECOND_JUMP_COLLISION
		
	elif current_step == Steps.SECOND_JUMP_COLLISION:
		popup_ui.init(fourth_popup_text)
		popup_ui.visible = true
		current_step = Steps.THIRD_JUMP_BH
		
	elif current_step == Steps.THIRD_JUMP_BH:
		popup_ui.init(fifth_popup_text)
		popup_ui.visible = true
		current_step = Steps.LAST_WORDS
		
	elif current_step == Steps.LAST_WORDS:
		current_step = Steps.END
		
func on_camera_reached_target():
	if current_step == Steps.BEGINNING:
		goto_next_step()

func on_end_reached():
	popup_ui.visible = false


func _on_FIRST_JUMP_body_entered(body):
	if current_step == Steps.PRESS_SPACE:
		goto_next_step()


func _on_SECOND_JUMP_body_entered(body):
	if current_step == Steps.FIRST_JUMP:
		goto_next_step()


func _on_THIRD_JUMP_BH_body_entered(body):
	if current_step == Steps.SECOND_JUMP_COLLISION:
		goto_next_step()


func _on_LAST_WORDS_body_entered(body):
	if current_step == Steps.THIRD_JUMP_BH:
		goto_next_step()
