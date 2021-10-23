extends TextureButton

func _ready() -> void:
	disabled = true
	visible = false

func _on_PlayButton_pressed():
	GameStats.restart_level()
	disabled = true
	get_tree().paused = false
	get_parent().visible = false
