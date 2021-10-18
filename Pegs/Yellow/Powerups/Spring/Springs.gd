extends StaticBody2D

func _ready() -> void:
	if GameStats.powerup_active:
		queue_free()
	else: 
		GameStats.powerup_active = true
			# spawn animation
		var main = get_tree().current_scene
		var Anim = preload("res://Pegs/Yellow/Powerups/Spawn/FromBottom.tscn")
		var anim = Anim.instance()
		main.add_child(anim)
	position = Vector2(0, 184)
	
	# spawn all the springs with some delays
	var counter = 0
	for child in get_children():
		if child.has_method("animate_spawn"):
			counter += 1
			child.animate_spawn(rand_range(1, counter))


func explode():
	queue_free()
	Engine.time_scale = 1

func make_green():
	for child in get_children():
		if child.has_method("animate_hit"):
			child.animate_hit()
	$DeathTimer.start()
	GameStats.powerup_active = false
	
	var SFX = preload("res://Pegs/Yellow/Powerups/Spring/SpringSFX.tscn")
	var main = get_tree().current_scene
	var sfx = SFX.instance()
	main.add_child(sfx)
	sfx.play(0.0)
	
	if GameStats.camera_fx:
		Engine.time_scale = 0.25

func spring():
	pass
