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
	
	
	# add score
	$ScoreCounter.trigger()
	
	# get the main scene of current peg and add new peg to it
	var main = get_tree().current_scene
	main.add_child(green_peg)
	
	var Powerups = preload("res://Pegs/Yellow/PowerupCards.tscn")
	var powerups = Powerups.instance()
	powerups.position = global_position
	
	main.add_child(powerups)
	
	#finally delete the old peg
	queue_free()
