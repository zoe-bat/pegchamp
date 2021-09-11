extends Button

export var scene = "res://Menu/MainMenu.tscn"

func _on_LevelSelectButton_pressed():
	disabled = true
	
	GameStats.reset_board()
	
	var main = get_tree().current_scene
	var Fadeout = load("res://Effects/FadeOut.tscn")
	var fadeout = Fadeout.instance()
	fadeout.scene_to_load = scene
	main.add_child(fadeout)
