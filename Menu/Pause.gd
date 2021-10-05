extends CenterContainer

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		_on_pause_button_pressed()

func _on_pause_button_pressed():
	if !GameStats.level_won && !GameStats.powerup_screen_active:
		get_tree().paused = !get_tree().paused
		visible = !visible
		Engine.time_scale = 1
