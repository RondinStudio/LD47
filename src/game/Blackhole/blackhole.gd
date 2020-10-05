extends Node2D

#Pour modifier le rayon et la force du trou noir on les export ( modification depuis la scène )
###
export (int) var RADIUS = 200
export (int) var FORCE = 10
###
var player
# Le joueur ne spawnera jamais sur un trou noir donc on initialise apply_forces à false
var apply_forces = false


func _ready():
	$Aura/attraction.shape.radius = RADIUS
	$AnimationPlayer.play("Rotate")
	$ShockwaveAnimationPlayer.play("shockwave")
	$pivot.init($Aura/attraction.shape.radius)


# warning-ignore:unused_argument
func _physics_process(delta):
	# Si le vaisseau est dans la zone d'attraction du trou noir, il subit de nouvelles forces.
	if apply_forces:
		# La force d'attraction dépend de la distance vaisseau - trou noir.
		# On a : début = bout de l'aire du trou noir, fin = 0 le "centre" du trou noir, position entre début/ fin = position du vaisseau
		var pull_force = inverse_lerp($Aura/attraction.shape.radius, 0, $Sprite.global_position.distance_to(player.position))
		# Le bout du vaisseau rentre dans la zone d'attraction avant que le centre du vaisseau n'y soit 
		# on doit donc vérifier que pull force n'est pas négatif et enlever les forces subies si le vaisseau n'est pas totalement rentré
		if pull_force <= 0:
			pull_force = 0
		# On oriente l'attraction subie vers le centre du trou noir
		var attraction_direction = (($Aura.global_position) - (player.global_position)).normalized()
		# On transforme la force subie en velocity pour appliuer ces forces directement sur le mouvement du vaisseau 
		# ( à traver applied_forces)
		var added_velocity = attraction_direction * (pull_force * FORCE)
		player.applied_forces += added_velocity

func _on_Aura_body_entered(body):
	# On vérifie que le body entered est bien le vaisseau du joueur ( et pas des astéroïdes )
	if body.name == "Spaceship":
		player = body
		# On passe apply_forces à true pour que le process applique les forces sur le vaisseau
		apply_forces = true

func _on_Aura_body_exited(body):
	if body == player:
		apply_forces = false

func _on_Centre_body_entered(body):
	if body.name == "Spaceship":
		player.set_physics_process(false)
		player.get_node("AnimationPlayer").play("Death")
