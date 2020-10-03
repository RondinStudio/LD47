extends Node2D

export var rotation_speed = PI
var orbiting = false
var speed = 1  # rotation speed (in radians)
var radius = 20  # desired orbit radius
var gaucheDroite = true


func _ready():
	pass
	
func _physics_process(delta):
	if gaucheDroite == true:
		$Pivot.rotation += speed * delta
	else:
		$Pivot.rotation -= speed * delta

func _on_Gravity_body_entered(body):
	if (body.is_in_group("joueur")):
		$Pivot/OrbitPosition.global_position = body.global_position
#		var VectorEntreDeux = global_position-body.global_position
#		print(VectorEntreDeux)
#		var movedir = Vector2(1,0).rotated(body.rotation)
#		print(movedir)
#		print(VectorEntreDeux.angle_to(movedir))
	$Pivot.rotation += speed * delta


func _on_Gravity_body_entered(body):
	if (body.is_in_group("joueur")):
		$Pivot/OrbitPosition.global_position = body.global_position 
		body.orbit($Pivot/OrbitPosition)
		body.planete = self



#func _on_Gravity_body_exited(body):
#	if (body.is_in_group("joueur") and orbiting == true):
#		orbiting = false
#		print("c'est plus un joueur")
#		$Pivot.remove_child(body)
#		add_child_below_node(get_parent(), body)
#		body.desorbit()
