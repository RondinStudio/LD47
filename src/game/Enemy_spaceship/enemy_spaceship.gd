extends KinematicBody2D

onready var path_follow = get_parent()


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


export var speed = 250  

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	MovementLoop(delta)

func MovementLoop(delta):
	var prepos = path_follow.get_global_position()
	path_follow.set_offset(path_follow.get_offset() + speed*delta)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


