extends KinematicBody2D

enum {LEFT, RIGHT}
var state = RIGHT

export var speed = 0.75

func _physics_process(_delta):
	match state:
		LEFT: move_left()
		RIGHT: move_right()

func move_right():
	var collide = move_and_collide(Vector2(speed * Engine.time_scale, 0))
	if collide:
		state = LEFT

func move_left():
	var collide = move_and_collide(Vector2(-speed * Engine.time_scale, 0))
	if collide:
		state = RIGHT


func _on_BallDetectionArea_body_entered(_body):
	# shoot confetti
	var Confetti = load("res://Bucket/Confetti.tscn")
	var confetti = Confetti.instance()
	var main = get_tree().current_scene
	main.add_child(confetti)
	confetti.position = position
	
	GameStats.balls_left += 1
