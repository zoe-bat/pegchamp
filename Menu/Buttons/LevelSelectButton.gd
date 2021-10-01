extends Button

export var scene = "res://Menu/MainMenu.tscn"
export var unlock_points_required = 0

func _ready():
	if unlock_points_required > GameStats.unlock_points:
		disabled = true
		text = String(unlock_points_required - GameStats.unlock_points) + " more points"

func _on_SceneSelectButton_pressed():
	GameStats.set_current_scene(scene)
