extends TextureButton



func _on_RestartButton_pressed():
	GameStats.restart_level()
	disabled = true
	
