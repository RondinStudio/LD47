extends Control

func _ready():
	pass # Replace with function body.

func _on_Exit_pressed():
	get_tree().quit()


func _on_Start_pressed():
	get_tree().change_scene("res://src/UI/Debut1erNiveau.tscn")

