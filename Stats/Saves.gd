extends Node

var save_path = "user://save.dat"

func _ready():
	load_game()

func save_game():
	var data = {
		"unlock_points" : GameStats.unlock_points
	}
	
	print(data)
	
	var file = File.new()
	var err = file.open(save_path, File.WRITE)
	if err == OK:
		file.store_var(data)
		file.close()

func load_game():
	var file = File.new()
	if file.file_exists(save_path):
		var err = file.open(save_path, File.READ)
		if err == OK:
			var data = file.get_var()
			file.close()
			load_unlock_points(data)

func load_unlock_points(data):
	GameStats.unlock_points = data.unlock_points
