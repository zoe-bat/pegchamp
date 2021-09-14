extends VBoxContainer

func _ready():
	var _game_stats = GameStats.connect("current_stage_changed", self, "update_info")

func update_info(stage):
	$HBoxContainer/PlayButton.disabled = false
	var Stage = load(stage)
	stage = Stage.instance()
	
	$ScoreLabel.text = stage.stage_name
	$HBoxContainer/PlayButton.visible = true
