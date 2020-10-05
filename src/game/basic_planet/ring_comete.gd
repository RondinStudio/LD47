extends Node2D

var radius = 0
var circumference = 0.0
var nb_points = 0
var current_nb_points = 0
const RECT_SIZE = Vector2(6, 6)

func init(radius_param):
	radius = radius_param
	circumference = 2 * radius * PI
	nb_points = circumference / 60
	$Position2D/SpawnPos.position = Vector2(0, radius)
	print("nb_points = ", nb_points)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if (current_nb_points <= nb_points):
		$Position2D.rotation_degrees += 360/nb_points
		var rect = ColorRect.new()
		rect.color = Color.beige
		rect.rect_global_position = $Position2D/SpawnPos.global_position - RECT_SIZE/2
		rect.rect_size = RECT_SIZE
		self.add_child(rect)
		print("rect.rect_position = ", rect.rect_position)
		current_nb_points += 1
