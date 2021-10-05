extends Sprite

func _ready():
	var _balls_connection = GameStats.connect("balls_changed", self, "set_balls")
	set_balls()

func set_balls():
	if GameStats.balls_left >= 1:
		var old_region_size = get_region_rect().size.y
		var new_region = Rect2(0, 0, old_region_size * GameStats.balls_left - old_region_size, old_region_size)
		set_region_rect(new_region)
		visible = true
	else: visible = false
