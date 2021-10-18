extends Node2D

func _ready() -> void:
	global_position = Vector2(0, 184)
	spawn_animations()
	$Particles2D.emitting = true

func spawn_animations():
	var Sprite = preload("res://Pegs/Yellow/Powerups/Spawn/FromBottomSprite.tscn")
	var counter = 0
	while counter <= 12:
		var sprite = Sprite.instance()
		add_child(sprite)
		sprite.play("spawn")
		sprite.offset = Vector2(counter * 32, -32)
		sprite.global_position = global_position
		counter += 1


