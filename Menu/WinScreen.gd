extends CanvasLayer

func _ready():
	$AnimationPlayer.play("win")
	while GameStats.balls_left >= 0:
		GameStats.set_score_to(GameStats.score + 15 * GameStats.multiplier)
		GameStats.add_balls(-1)


func _on_AnimationPlayer_animation_finished(_anim_name):
	$Congratulations.visible = false
	$Congratulations2.visible = false
	$Control.visible = true
