extends StaticBody2D

func make_green():
	var main = get_tree().current_scene
	var Green_bar = preload("res://Pegs/Green/GreenBar.tscn")
	var green_bar = Green_bar.instance()
	
	green_bar.global_position = global_position
	green_bar.global_rotation = global_rotation
	
	main.add_child(green_bar)
	queue_free()

func bouncy():
	pass
