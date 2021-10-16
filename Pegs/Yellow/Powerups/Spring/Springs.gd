extends StaticBody2D

func _ready() -> void:
	position = Vector2(0, 184)

func explode():
	queue_free()

func make_green():
	for child in get_children():
		if child.has_method("animate"):
			child.animate()
	$DeathTimer.start()

func spring():
	pass
