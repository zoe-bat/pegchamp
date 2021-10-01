extends Label

func _ready():
	var _connected = GameStats.connect("multiplier_changed", self, "update_text")

func update_text(value):
	text = "x" + String(value)
