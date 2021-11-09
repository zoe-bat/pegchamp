extends Camera2D

func _process(_delta: float) -> void:
	global_position = lerp(global_position, get_global_mouse_position(), 0.05)
