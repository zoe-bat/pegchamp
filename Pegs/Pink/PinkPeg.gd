extends StaticBody2D

func _ready():
	GameStats.pinks_left += 1

# turns the pegs green
func make_green():
	# preload a green peg
	var Green_peg = load("res://Pegs/Green/GreenPeg.tscn")
	# instance it
	var green_peg = Green_peg.instance()
	# global position in case the parent node gets transformed
	green_peg.global_position = global_position
	
	# get the main scene of current peg and add new peg to it
	var main = get_tree().current_scene
	main.add_child(green_peg)
	
	#finally delete the old peg
	GameStats.pinks_left -= 1
	win_level()
	Engine.time_scale = 1
	queue_free()
	
func win_level():
	if GameStats.pinks_left <= 0:
		GameStats.level_won = true

func bouncy():
	pass

# below is the slowmo stuff
func _on_Area2D_body_entered(_body):
	Engine.time_scale = clamp(Engine.time_scale * 0.25, 0.1, 1)
	$SlowmoTimer.start()

func _on_Area2D_body_exited(_body):
	Engine.time_scale = 1

func _on_LastPegCollision_body_entered(_body):
	if GameStats.pinks_left <= 1:
		Engine.time_scale = clamp(Engine.time_scale * 0.15, 0.1, 1)
		$SlowmoTimer.start()

func _on_Timer_timeout():
	Engine.time_scale = 1
