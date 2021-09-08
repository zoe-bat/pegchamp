extends Node2D

func _ready():
	$Green.emitting = true
	$Yellow.emitting = true
	$Pink.emitting = true
	$AnimationPlayer.play("+1Ball")


func _on_KillTimer_timeout():
	queue_free()
