extends KinematicBody2D

var orbited = false
var positionToFollow
const MOVE_SPEED = 400
var velocity = Vector2()
var applied_forces = Vector2()
const ACCELERATION = 0.03
onready var planete = get_parent().get_node("Planet")
var speed = 0
const MAX_SPEED = 1.4

var movement = Vector2(0, 0)
var direction_tangent = 1

func _ready():
	pass
	
	
func _physics_process(delta):
	var velocity = Vector2()  # The player's movement vector.
	if orbited == false:
		var movedir = Vector2(1,0).rotated(rotation)
		if Input.is_action_pressed("space"):
			$AnimationPlayer.play("Moving")
			speed += ACCELERATION
			speed = clamp(speed, 0, MAX_SPEED)
		else:
			$AnimationPlayer.play("Idle")
		velocity = speed * movedir
		movement = ((velocity * MOVE_SPEED)+ applied_forces) * delta 
		look_at(position + movement)
		move_and_collide(movement)
		applied_forces = Vector2(0,0)
	if orbited == true:
		$AnimationPlayer.play("Idle")
		speed = 0
		self.position = positionToFollow.global_position
		var vect = position.direction_to(planete.position)
		var tangent = vect.tangent() * 50
		
		var position_to_look_at = position + tangent * direction_tangent
		look_at(position_to_look_at)
		
		if Input.is_action_pressed("space"):
			orbited = false
			positionToFollow = null
			movement = ((tangent.normalized() * MOVE_SPEED/2)+ applied_forces) * delta 
			move_and_collide(movement)
			speed = 0.5

func orbit(toFollow , direction):
	positionToFollow = toFollow
	direction_tangent = direction
	orbited = true

func desorbit():
	orbited = false
