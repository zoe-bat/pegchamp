extends Node2D

var appeared = false

export var ball_number = 16

func _ready() -> void:
	$AnimatedSprite.frame = 0
	$AnimatedSprite.play("appear")
	$Particles2D.emitting = true

func set_time_scale():
	Engine.time_scale = 1


func _on_AnimatedSprite_animation_finished() -> void:
	if appeared:
		queue_free()
	else:
		appeared = true
		$AnimatedSprite.play("disappear")
		spawn_balls()

func spawn_balls():
	if GameStats.camera_fx:
		Engine.time_scale = 0.25
		$SlowmoTimer.start()
	
	var i = 0
	while i < ball_number:
		var Ball = preload("res://Pegs/Yellow/Powerups/Scattershot/ScattershotBall.tscn")
		var ball = Ball.instance()
		var main = get_tree().current_scene
		
		ball.global_position = global_position
		
		main.add_child(ball)
		
		i += 1
