extends KinematicBody2D

signal level_just_won
enum {IDLE, MOVEUP, MOVEDOWN}
var state = IDLE

func _on_Killzone_body_entered(body):
	if body.has_method("reset_ball"):
		body.reset_ball()
		state = MOVEUP
		GameStats.add_balls(-1)
		
	if body.has_method("explode"):
		if (body.has_method("set_particle_direction")):
			body.set_particle_direction(Vector2(0, -10))
		body.explode()

func _physics_process(_delta):
	match state:
		IDLE: pass
		MOVEUP: moveup()
		MOVEDOWN: movedown()

func moveup():
	var _collide = move_and_collide(Vector2(0, -5))

func movedown():
	var _collide = move_and_collide(Vector2(0, 5))
	GameStats.set_multiplier(1)

func _on_ZoneDetection_area_entered(_area):
	if (state == MOVEUP):
		state = MOVEDOWN
		if GameStats.level_won:
			emit_signal("level_just_won")
	else: state = IDLE
