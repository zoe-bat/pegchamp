extends CanvasLayer

# set scene you want to load, uses main menu as fallback
var scene_to_load = "res://Menu/MenuPage.tscn"

func _ready():
	$TransitionSprite.visible = true
	$AnimationPlayer.play("FadeOut")

func finish_animation():
	var _new_scene = get_tree().change_scene(scene_to_load)
