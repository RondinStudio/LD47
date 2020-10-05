extends Node2D

#export (PackedScene) var etoile
#export (int) var nb_etoile
#var nb_actuel = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#func _on_Timer_timeout():
#	var color_rect = $ParallaxBackground/ColorRect
#	var rect_x = floor(color_rect.rect_size.x)
#	var rect_y = floor(color_rect.rect_size.y)
#	var x = randi()%1920
#	var y = randi()%1080
#	var new_etoile = etoile.instance()
#	new_etoile.position.x = x
#	new_etoile.position.y = y
#	add_child_below_node($ParallaxBackground, new_etoile)
#	$ParallaxBackground.move_child($ParallaxBackground/ColorRect, nb_actuel+1)
#	move_child(new_etoile, 1)
#	nb_actuel += 1
#	if (nb_actuel == nb_etoile):
#		$ParallaxBackground/Timer.stop()
