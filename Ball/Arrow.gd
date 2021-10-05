extends Sprite

func _process(_delta):
	if !visible: pass
	look_at(get_global_mouse_position())
