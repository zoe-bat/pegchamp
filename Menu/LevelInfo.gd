extends PanelContainer

onready var stage_label = $VBoxContainer/StageName
onready var score = $VBoxContainer/ScoreLabel
onready var play = $VBoxContainer/PlayButton

func _ready():
	var _game_stats = GameStats.connect("current_stage_changed", self, "update_info")

func update_info(stage):
	play.disabled = false
	var Stage = load(stage)
	stage = Stage.instance()
	
	score.text = String(stage.high_score)
	play.visible = true
	
	var filename = "user://" + stage.stage_name + ".dat"
	var file = File.new()
	if file.file_exists(filename):
		var err = file.open(filename, File.READ)
		if err == OK:
			var data = file.get_var()
			file.close()
			score.text = String(data.high_score)
			stage_label.text = String(stage.stage_name)
