extends KinematicBody2D

var orbited = false
var radius = 30
var _centre
var _angle = 0
var positionToFollow
const MOVE_SPEED = 400
var velocity = Vector2()
var applied_forces = Vector2()
const ACCELERATION = 0.1
var acceleration_remainder = 0
onready var planete = get_parent().get_node("Planet")
#const MINIMUM_SPEED = 150

var raycast_to_planete = RayCast2D.new()
var raycast_angledroit = RayCast2D.new()


func _ready():
	set_process(true)
	add_child(raycast_to_planete)
	add_child(raycast_angledroit)
	
	
func _physics_process(delta):
	var velocity = Vector2()  # The player's movement vector.
	if orbited == false:
#		print("rotation =", rotation)
		var movedir = Vector2(1,0).rotated(rotation)
		print("movedir =", movedir)
		if Input.is_action_pressed("ui_up"):
			velocity = velocity.linear_interpolate(movedir , ACCELERATION)
			acceleration_remainder += ACCELERATION
		else:
			velocity = movedir * acceleration_remainder
		var movement = ((velocity * MOVE_SPEED)+ applied_forces) * delta 
		look_at(position + movement)
#		print("movement = ", movement)
		move_and_collide(movement)
		applied_forces = Vector2(0,0)
#		print("movement =", movement)
	if orbited == true:
		acceleration_remainder = 0
		self.position = positionToFollow.global_position
		var vect = position.direction_to(planete.position)
		var tangent = vect.tangent() * 50
		
		raycast_to_planete.cast_to = vect*50
		raycast_angledroit.cast_to = tangent
		
		var position_to_look_at = position + tangent 
		look_at(position_to_look_at)
		
		if Input.is_action_pressed("space"):
			orbited = false
			positionToFollow = null
			var movement = ((tangent.normalized() * MOVE_SPEED/2)+ applied_forces) * delta 
			move_and_collide(movement)
			velocity = tangent.normalized()/2
			
#	print("rotation = ", rotation_degrees)
	


func orbit(toFollow):
	positionToFollow = toFollow
	orbited = true

func desorbit():
	orbited = false
