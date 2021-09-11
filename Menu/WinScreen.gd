extends CanvasLayer

func _ready():
	$AnimationPlayer.play("win")


func _on_AnimationPlayer_animation_finished(_anim_name):
	$Congratulations.visible = false
	$Congratulations2.visible = false
	$Control.visible = true
