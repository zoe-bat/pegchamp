extends CenterContainer

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		_on_pause_button_pressed()

func _on_pause_button_pressed():
	get_tree().paused = !get_tree().paused
	visible = !visible
