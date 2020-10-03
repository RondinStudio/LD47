extends Node2D

export (int) var RADIUS = 200
export (int) var FORCE = 150
var player
var apply_forces = false


func _ready():
	$Aura/attraction.shape.radius = RADIUS

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		player = body
		apply_forces = true

func _on_Area2D_body_exited(body):
	if body == player:
		apply_forces = false

func _physics_process(delta):
	# Si le vaisseau est dans la zone d'attraction du trou noir, il subit de nouvelles forces.
	if apply_forces:
		# La force d'attraction dépend de la distance vaisseau - trou noir.
		var pull_force = inverse_lerp($Aura/attraction.shape.radius, 0, $Sprite.global_position.distance_to(player.position))
		var attraction_direction = ($Aura.global_position - player.global_position).normalized()
		var added_velocity = attraction_direction * (pull_force * FORCE)
