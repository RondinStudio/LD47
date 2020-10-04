extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$CPUParticles2D.process_material.emission_sphere_radius = (self.get_parent().get_node("Aura/attraction").shape.radius)/2
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
