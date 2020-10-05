extends KinematicBody2D

var speed

func _ready():
	speed = rand_range(0, 2)
	
	var texture_rand = randi() % 3
	if texture_rand == 0:
		$Sprite.texture = load("res://assets/graphisme/Asteroide 1.png")
	elif texture_rand == 1:
		$Sprite.texture = load("res://assets/graphisme/Asteroide 2.png")
	else:
		$Sprite.texture = load("res://assets/graphisme/Asteroide 3.png")

# Fais tourner les astéroïdes sur eux même, dans le deux sens grace à la distribution gaussienne
func _process(delta):	
	self.rotation += speed * delta
