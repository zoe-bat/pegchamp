extends Label

func _ready():
	var _connect = GameStats.connect("score_changed", self, "update_score_text")
	text = String(GameStats.score)

func update_score_text(value):
	text = String(value)
