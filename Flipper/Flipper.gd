extends KinematicBody2D

func _physics_process(delta):
	if Input.is_action_pressed("shoot"):
		rotation = lerp(rotation, -90, 0.9)
	else: rotation = 0
func bouncy():
	pass
