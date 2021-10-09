extends Node2D

var scenes = []

func _ready():
	GameStats.connect("powerup_picked", self, "queue_free")
	scenes.append("res://Pegs/Yellow/PowerupCards/Scattershot.tscn")
	scenes.append("res://Pegs/Yellow/PowerupCards/ExtraBall.tscn")
	
	spawn_powerups(2)
	get_tree().paused = true
	GameStats.powerup_screen_active = true
	
	$CanvasLayer/AnimationPlayer.play("Flyin")
	
func spawn_powerups(value):
	spawn_powerup(GameStats.stage_powerup)
	var i = 0
	while i < value:
		var timer = Timer.new()
		timer.connect("timeout", self, "spawn_random_powerup")
		timer.one_shot = true
		
		add_child(timer)
		i += 1
		timer.start(i * 0.12)

func spawn_random_powerup():
	spawn_powerup(scenes[rand_range(0, scenes.size())])
	# spawn_powerup(scenes[rand_range(0, scenes.size()])

func spawn_powerup(new_powerup_string):
	var NewPowerup = load(new_powerup_string)
	var new_powerup = NewPowerup.instance()
	new_powerup.set_spawn_position(self.global_position)
	$CanvasLayer/CenterContainer/HBoxContainer.add_child(new_powerup)
