extends Label

func _ready():
	visible = false
	var _connected = GameStats.connect("pink_changed", self, "update_text")
	call_deferred("update_text", GameStats.pinks_left)

func update_text(value):
	visible = true
	text ="left " + String(value)
