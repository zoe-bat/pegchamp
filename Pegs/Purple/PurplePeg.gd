extends StaticBody2D

# turns the pegs green
func make_green():
	# preload a green peg
	var Green_peg = load("res://Pegs/Green/GreenPeg.tscn")
	# instance it
	var green_peg = Green_peg.instance()
	# take care of positioning
	# green_peg.rotation = rotation + 5
	green_peg.global_position = global_position
	
	# get the main scene of current peg and add new peg to it
	var main = get_tree().current_scene
	main.add_child(green_peg)
	
	# increase multiplyier
	GameStats.add_to_multiplier()
	
	#finally delete the old peg
	queue_free()

func bouncy():
	pass
