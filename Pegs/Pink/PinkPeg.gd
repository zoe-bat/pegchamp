extends StaticBody2D

func _ready():
	var _connection = GameStats.connect("recount_pink", self, "count")
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
	# add score
	$ScoreCounter.trigger()
	
	#finally delete the old peg
	win_level()
	Engine.time_scale = 1
	queue_free()
	GameStats.recount_pink()
	
func win_level():
	if GameStats.pinks_left <= 0:
		GameStats.level_won = true

func bouncy():
	pass

# below is the slowmo stuff
func _on_Area2D_body_entered(_body):
	if GameStats.camera_fx:
		Engine.time_scale = clamp(Engine.time_scale * 0.25, 0.1, 1)
		$SlowmoTimer.start()

func _on_Area2D_body_exited(_body):
	Engine.time_scale = 1

func _on_LastPegCollision_body_entered(_body):
	if GameStats.pinks_left <= 1 && GameStats.camera_fx:
		Engine.time_scale = clamp(Engine.time_scale * 0.15, 0.1, 1)
		$SlowmoTimer.start()

func _on_Timer_timeout():
	Engine.time_scale = 1

# adds count of 1 for every pink peg
func count():
	GameStats.pinks_left += 1
