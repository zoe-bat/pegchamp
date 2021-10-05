extends Label

func _ready():
	text = "xp: " + String(GameStats.unlock_points)
