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

func _physics_process(delta):
	# Velocity représente le vecteur de mouvement du player
	var velocity = Vector2()
	# Quand le vaisseau n'est pas en orbite autour d'une planète 
	if orbited == false:
		# On créé un vecteur représentant l'orientation du vaisseau
		var movedir = Vector2(1,0).rotated(rotation)
		# Quand le joueur veut accélérer
		if Input.is_action_pressed("space"):
			$AnimationPlayer.play("Moving")
			$trail/CPUParticles2D.emitting = true
			$trail2/CPUParticles2D.emitting = true
			speed += ACCELERATION
			# Cette speed est capée à MAX_SPEED
			speed = clamp(speed, 0, MAX_SPEED)
		else:
			$AnimationPlayer.play("Idle")
			$trail/CPUParticles2D.emitting = false
			$trail2/CPUParticles2D.emitting = false

		velocity = speed * movedir
		# On applique les forces au player
		movement = ((velocity * MOVE_SPEED)+ applied_forces) * delta 
		# Le vaisseau ne peut avancer que vers là où son nez pointe
		look_at(position + movement)
		move_and_collide(movement)
		# On remet à 0 les forces appliquées pour éviter les problèmes
		applied_forces = Vector2(0,0)
	# Quand le vaisseau est en orbite
	if orbited == true:
		$AnimationPlayer.play("Idle")
		# On remet speed à 0 pour permettre au joueur d'accélérer quand il sortira de l'orbite
		speed = 0
		# Le vaisseau suit l'orbite tranquillou
		self.position = positionToFollow.global_position
		var vect = position.direction_to(planete.position)
		var tangent = vect.tangent() * 50
		# On oriente le vaisseau dans la bonne direction pendant l'orbite ( la tangeante de l'orbite au point 
		# où est le vaisseau) 
		var position_to_look_at = position + tangent * direction_tangent
		look_at(position_to_look_at)
		# Pour se propulser en dehors de l'orbite
		if Input.is_action_pressed("space"):
			# On remet orbited à false pour qu'à la prochaine frame le vaisseau re-subisse les forces extérieures
			orbited = false
			# Le vaisseau ne suit donc plus l'orbite
			positionToFollow = null
			# Le mouvement est lancé à la tangeante de l'orbite et pas dans l'inclinaison initiale du vaisseau
			movement = ((tangent.normalized() * MOVE_SPEED/2)+ applied_forces) * delta 
			move_and_collide(movement)
			# On donne une speed au vaisseau pour ne pas qu'il soit à l'arrêt en sortant de l'orbite et
			# garde une vitesse proche de celle d'orbite
			speed = 0.5

# Fonction appelée par Planet pour indiqué qu'un corps est rentré en orbite
func orbit(toFollow , direction):
	positionToFollow = toFollow
	direction_tangent = direction
	orbited = true

func desorbit():
	orbited = false

func _on_VisibilityNotifier2D_screen_exited():
	var father = get_parent()
	position = father.get_node("spawn_position").position

