extends Node

func _ready():
	var Jukebox = preload("res://Music/Music.tscn")
	var jukebox = Jukebox.instance()
	var main = get_tree().current_scene
	main.add_child(jukebox)
