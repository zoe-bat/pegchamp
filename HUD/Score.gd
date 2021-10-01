extends Label

func _ready():
	update_text(GameStats.score)
	var _connected = GameStats.connect("score_changed", self, "update_text")

func update_text(value):
	text = String(value)
