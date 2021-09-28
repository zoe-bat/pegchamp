extends TextureButton

func _on_PlayButton_pressed():
	GameStats.restart_level()
	disabled = true
	get_tree().paused = false
	get_parent().visible = false
