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
	
	var Powerup = load(GameStats.current_powerup)
	var powerup = Powerup.instance()
	
	powerup.global_position = global_position
	
	# has to run before adding powerup as child 
	# because adding the powerup changes powerup_active to true
	if !GameStats.powerup_active:
		var SFX = preload("res://Pegs/Yellow/Powerups/PowerupSFX.tscn")
		var sfx = SFX.instance()
		main.add_child(sfx)
		sfx.global_position = global_position
		sfx.play(0)
	
	main.add_child(powerup)
	
	#finally delete the old peg
	queue_free()
