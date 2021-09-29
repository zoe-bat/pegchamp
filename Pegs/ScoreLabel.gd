extends Node2D


func trigger(display_text):
	$Node2D.global_position = global_position
	$Node2D/Label.text = String(display_text)
	$Node2D/Label.visible = true
	
	$AnimationPlayer.play("move_up")
	
func delete():
	queue_free()
