extends Node

var position_to_move_to:Vector2 = Vector2()
var direction_to_move_to:Vector2 = Vector2()
var is_orbit:bool = false
var has_grabbed_target:bool = false
var player

var speed = 0
var acc = 0.025
var velocity:Vector2 = Vector2()
var movement:Vector2 = Vector2()
var MAX_SPEED = 490

var DIRECTION_TRESHOLD = 10

func _ready():
# warning-ignore:return_value_discarded
	Events.connect("player_enter_orbit", self, "on_player_enter_orbit")
# warning-ignore:return_value_discarded
	Events.connect("player_leave_orbit", self, "on_player_leave_orbit")

func _physics_process(delta):
	if is_orbit == false:
		position_to_move_to = player.global_position

	if self.global_position.distance_to(position_to_move_to) >= DIRECTION_TRESHOLD:  
		direction_to_move_to = self.global_position.direction_to(position_to_move_to)
		speed += acc
		speed = clamp(speed, 0, 1)
		velocity = direction_to_move_to * speed
		movement = velocity * MAX_SPEED * delta
		self.global_position += movement
#
	elif is_orbit == true:
		speed = 0
	
	#Valeur négative en paramètre parce que Valentin avait trop bu lors du codage de sa fonction et que c'est à l'envers
	$Nebulous_background.get_node("ParallaxBackground/ColorRect").set_offset(-self.global_position.x, -self.global_position.y)
	
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == BUTTON_WHEEL_UP:
				self.zoom *= 0.9
			if event.button_index == BUTTON_WHEEL_DOWN:
				self.zoom *= 1.1
			self.zoom.x = clamp(self.zoom.x, 0.5, 2)
			self.zoom.y = clamp(self.zoom.y, 0.5, 2)
	
func init(player_param):
	player = player_param

func on_player_enter_orbit(planet_pos):
	position_to_move_to = planet_pos
	is_orbit = true

func on_player_leave_orbit():
	is_orbit = false
