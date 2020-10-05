extends ColorRect

func _on_Exit_pressed():
	get_tree().quit()

func _on_Resume_pressed():
	self.owner.on_resume()

func _on_Retry_pressed():
	get_tree().change_scene("res://src/levels/level_container.tscn")
