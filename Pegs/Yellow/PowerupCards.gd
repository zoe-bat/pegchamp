extends Node2D

var scenes = []

func _ready():
	GameStats.connect("powerup_picked", self, "queue_free")
	scenes.append("res://Pegs/Yellow/PowerupCards/Scattershot.tscn")
	
	spawn_powerups(3)
	get_tree().paused = true
	GameStats.powerup_screen_active = true
	
	
func spawn_powerups(value):
	var i = 0
	while i < value:
		var NewPowerup = load(scenes[rand_range(0, scenes.size())])
		var new_powerup = NewPowerup.instance()
		new_powerup.set_spawn_position(self.global_position)
		var main = get_tree().current_scene
		$CanvasLayer/CenterContainer/HBoxContainer.add_child(new_powerup)
		i += 1

