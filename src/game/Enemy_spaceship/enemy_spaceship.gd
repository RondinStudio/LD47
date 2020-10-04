extends KinematicBody2D

onready var path_follow = get_parent()
export var speed = 250  

func _physics_process(delta):
	var _prepos = path_follow.get_global_position()
	path_follow.set_offset(path_follow.get_offset() + speed*delta)
