extends Node2D

export (float) var speed = 0.2

func _physics_process(delta):
	rotation += speed * delta

