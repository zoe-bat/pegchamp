extends Button

export var scene = "res://Menu/MainMenu.tscn"
export var powerup_card = "res://Pegs/Yellow/PowerupCards/ExtraBall.tscn"
export var unlock_points_required = 0

func _ready():
	if unlock_points_required > GameStats.unlock_points:
		disabled = true
		text = String(unlock_points_required - GameStats.unlock_points) + " more xp"

func _on_SceneSelectButton_pressed():
	GameStats.set_current_scene(scene)
	GameStats.stage_powerup = powerup_card
