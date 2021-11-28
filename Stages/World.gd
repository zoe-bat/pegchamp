extends Node2D

export var stage_name = "test stage"
export var high_score = 0
export var already_beaten = false
export var powerup_card = "res://Pegs/Yellow/PowerupCards/ExtraBall.tscn"

func _ready():
	load_level()
	var _killzone_connec = GameStats.connect("win_animation_finished", self, "save_level")
	GameStats.multiplier = 1

func _physics_process(_delta):
	fast_forward()

func fast_forward():
	if (Input.is_action_pressed("fast_forward")):
		Engine.time_scale = 3
	if (Input.is_action_just_released("fast_forward")):
		Engine.time_scale = 1

func load_level():
	var filename = give_filename()
	var file = File.new()
	if file.file_exists(filename):
		var err = file.open(filename, File.READ)
		if err == OK:
			var data = file.get_var()
			file.close()
			load_data(data)

func load_data(data):
	already_beaten = data.already_beaten
	high_score = data.high_score
	
	
func save_level():
	if !already_beaten:
		GameStats.unlock_points += 10
		already_beaten = true
	else: GameStats.unlock_points += 5
	
	
	if GameStats.score > high_score:
		# new highscore!!!
		high_score = GameStats.score
	
	var data = {
		"high_score" : high_score,
		"already_beaten" : already_beaten
	}
	var file = File.new()
	var err = file.open(give_filename(), File.WRITE)
	if err == OK:
		file.store_var(data)
		file.close()
	else: print("something went wrong while saving your high scores! please check file permissions!")
	Saves.save_game()

func give_filename():
	var save_path = "user://" + String(stage_name) + ".dat"
	return save_path
