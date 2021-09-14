extends TextureButton



func _on_FullscreenButton_toggled(_button_pressed):
	OS.window_fullscreen = !OS.window_fullscreen
