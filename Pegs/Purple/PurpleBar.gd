extends StaticBody2D

func make_green():
	var main = get_tree().current_scene
	var Green_bar = preload("res://Pegs/Green/GreenBar.tscn")
	var green_bar = Green_bar.instance()
	
	green_bar.global_position = global_position
	green_bar.global_rotation = global_rotation
	
	$ScoreCounter.trigger()
	
	main.add_child(green_bar)
	GameStats.add_to_multiplier()
	queue_free()

func bouncy():
	pass
