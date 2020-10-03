extends Node2D

#var rng = RandomNumberGenerator.new()
#var Asteroid = preload("res://src/game/asteroids/Asteroid.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#	fill()

#func fill():
#	var vertices = $Area2D/CloudShape.polygon
#	var bounds = get_bounds(vertices)
#	var asteroids = []
#	var area_covered = 0
#	while area_covered < 2 :
#		var asteroid = generate_asteroid(bounds, asteroids)
#		if (asteroid != null):
#			self.add_child(asteroid)
#			asteroids.append(asteroid)
#			area_covered += 1
#
#
#func generate_asteroid(bounds, asteroids):
#	var space_rid = get_world_2d().space
#	var space_state = Physics2DServer.space_get_direct_state(space_rid)
#	rng.randomize()
#	var pos = Vector2()
#	pos.x = rng.randi_range(bounds["min_x"], bounds["max_x"])
#	pos.y = rng.randi_range(bounds["min_y"], bounds["max_y"])
#	if (space_state.intersect_point_on_canvas(pos, $Area2D/CloudShape.get_canvas().get_id()) && intersect_asteroids(pos, asteroids, space_state) == false):
#		var new_asteroid = Asteroid.instance()
#		new_asteroid.position = pos
#		return new_asteroid
#	else :
#		return null
#
#func intersect_asteroids(pos, asteroids, space_state):
#	for asteroid in asteroids :
#		if (space_state.intersect_point_on_canvas(pos, asteroid.get_canvas().get_id())):
#			return true
#	return false
#
#func get_bounds(vertices):
#	var bounds = {
#		"min_x" : 2000,
#		"min_y" : 2000,
#		"max_x" : 0,
#		"max_y" : 0
#	}
#
#	for vertice in vertices:
#		if (vertice.x > bounds["max_x"]):
#			bounds["max_x"] = vertice.x
#		if (vertice.x < bounds["min_x"]):
#			bounds["min_x"] = vertice.x
#		if (vertice.y > bounds["max_y"]):
#			bounds["max_y"] = vertice.y
#		if (vertice.y < bounds["min_y"]):
#			bounds["min_y"] = vertice.y
#	return bounds
