extends KinematicBody2D

var orbited = false
var positionToFollow
const MOVE_SPEED = 400
var velocity = Vector2()
var applied_forces = Vector2()
const ACCELERATION = 0.03
var planete
var speed = 0
const MAX_SPEED = 1.4
var movement = Vector2(0, 0)
var direction_tangent = 1

func _physics_process(delta):
	if orbited == false:
		physics_process_in_movement(delta)
	
	if orbited == true:
		physics_process_in_orbit(delta)
			
func physics_process_in_movement(delta):
	if Input.is_action_pressed("space"):
		$AnimationPlayer.play("Moving")
		$trail/Particles2D.emitting = true
		$trail2/Particles2D.emitting = true
		speed += ACCELERATION
		speed = clamp(speed, 0, MAX_SPEED)
	else:
		$AnimationPlayer.play("Idle")
		$trail/Particles2D.emitting = false
		$trail2/Particles2D.emitting = false
		
	var movedir = Vector2(1,0).rotated(rotation)
	velocity = speed * movedir
	movement = ((velocity * MOVE_SPEED)+ applied_forces) * delta 
	look_at(position + movement)
	move_and_collide(movement)
	applied_forces = Vector2(0,0)
	
func physics_process_in_orbit(delta):
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

func orbit(planete_param, toFollow , direction):
	planete = planete_param
	positionToFollow = toFollow
	direction_tangent = direction
	orbited = true

func desorbit():
	orbited = false
	
func die():
	velocity = 0
	speed = 0
	movement = 0
	Events.emit_signal("player_death")

func _on_VisibilityNotifier2D_screen_exited():
	die()
