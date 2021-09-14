extends TextureButton

func _on_PlayButton_pressed():
	GameStats.restart_level()
	disabled = true
