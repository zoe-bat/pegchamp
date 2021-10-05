extends Node

var save_path = "user://save.dat"

func _ready():
	load_game()

func save_game():
	var data = {
		"unlock_points" : GameStats.unlock_points,
		"camera_fx" : GameStats.camera_fx,
		"music_volume" : AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music")),
		"sfx_volume" : AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX"))
	}
	
	var file = File.new()
	var err = file.open(save_path, File.WRITE)
	if err == OK:
		file.store_var(data)
		file.close()
		call_deferred("show_icon")


func load_game():
	var file = File.new()
	if file.file_exists(save_path):
		var err = file.open(save_path, File.READ)
		if err == OK:
			var data = file.get_var()
			file.close()
			load_unlock_points(data)
			load_volume(data)
			load_camera_fx(data)

func show_icon():
	var Floppy = preload("res://Effects/Floppy.tscn")
	var floppy = Floppy.instance()
	var main = get_tree().current_scene
	main.add_child(floppy)

func load_unlock_points(data):
	GameStats.unlock_points = data.unlock_points

func load_camera_fx(data):
	GameStats.camera_fx = data.camera_fx

func load_volume(data):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"),  data.sfx_volume)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"),  data.music_volume)
