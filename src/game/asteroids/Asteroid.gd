extends Node

var speed
var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	speed = rng.randfn(0, 2)
	set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.rotation += speed * delta

func _on_Body_body_entered(body):
	if (body.is_in_group("joueur")):
		print("mort")
