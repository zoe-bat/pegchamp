extends Button

export var scene = "res://Menu/MainMenu.tscn"

func _on_SceneSelectButton_pressed():
	GameStats.set_current_scene(scene)
