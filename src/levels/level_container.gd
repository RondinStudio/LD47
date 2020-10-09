extends Node2D


var niveau1 = load("res://src/levels/niveau1.tscn")
var niveau2 = load("res://src/levels/niveau2.tscn")
var niveau3 = load("res://src/levels/niveau3.tscn")
var niveau4 = load("res://src/levels/niveau4.tscn")
var niveau5 = load("res://src/levels/niveau5.tscn")


func _ready():
	if (Globals.current_level == 1):
		SoundManager.preload_resource_from_string("res://assets/son/Musics/son-niveau-1-loop.ogg")
		SoundManager.play_bgm("res://assets/son/Musics/son-niveau-1-loop.ogg", 0.0, -81, -1, SoundManager.get_playing_sounds()[0])
		var new_level = niveau1.instance()
		self.add_child(new_level)
	if (Globals.current_level == 2):
		var new_level = niveau2.instance()
		self.add_child(new_level)
	if (Globals.current_level == 3):
		var new_level = niveau3.instance()
		self.add_child(new_level)
	if (Globals.current_level == 4):
		var new_level = niveau4.instance()
		self.add_child(new_level)
	if (Globals.current_level == 5):
		var new_level = niveau5.instance()
		self.add_child(new_level)
	if (Globals.current_level > 1) :
		SoundManager.preload_resource(load("res://assets/son/Musics/son-niveau-2-loop.ogg"))
		SoundManager.play_bgm("res://assets/son/Musics/son-niveau-2-loop.ogg", 0.0, -81, -1, SoundManager.get_playing_sounds()[0])
	$Camera2D.init(get_child(2).get_node("Spaceship"), get_child(2).get_node("LevelLimits"))

func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		on_pause_pressed()

func on_pause_pressed():
	get_tree().paused = true
	$CanvasLayer/pause_popup.show()

func on_resume():
	get_tree().paused = false
	$CanvasLayer/pause_popup.hide()

# A TERME : AJOUTER DES FONCTIONS POUR MANIPULER LA MUSIQUE
