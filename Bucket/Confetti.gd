extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Green.emitting = true
	$Yellow.emitting = true
	$Pink.emitting = true
	$AnimationPlayer.play("+1Ball")


func _on_KillTimer_timeout():
	queue_free()
