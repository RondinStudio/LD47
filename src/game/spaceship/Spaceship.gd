extends KinematicBody2D

var orbited = false
var speed = 0.3
var radius = 30
var _centre
var _angle = 0
var positionToFollow

func _ready():
	set_process(true)

func _physics_process(delta):
	if orbited == false:
		var velocity = Vector2()  # The player's movement vector.
		if Input.is_action_pressed("ui_right"):
			velocity.x += 1
		if Input.is_action_pressed("ui_left"):
			velocity.x -= 1
		if Input.is_action_pressed("ui_down"):
			velocity.y += 1
		if Input.is_action_pressed("ui_up"):
			velocity.y -= 1
		if velocity.length() > 0:
			velocity = velocity.normalized() * 300
		move_and_collide(velocity * delta)
	if orbited == true:
		self.position = positionToFollow.global_position
		if Input.is_action_pressed("space"):
			orbited = false
			positionToFollow = null

func orbit(toFollow):
	positionToFollow = toFollow
	orbited = true

func desorbit():
	orbited = false
