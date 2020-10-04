extends Node

var speed
var rng = RandomNumberGenerator.new()

func _ready():
	# Applique un seed au randomizer ( nécessaire pour être vrmt random )
	rng.randomize()
	# Distribution gaussienne
	speed = rng.randfn(0, 2)
	set_process(true)

# Fais tourner les astéroïdes sur eux même, dans le deux sens grace à la distribution gaussienne
func _process(delta):
	self.rotation += speed * delta

# Pour la mort du player ( à finir )
func _on_Body_body_entered(body):
	if (body.is_in_group("joueur")):
		print("mort")


