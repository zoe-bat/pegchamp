extends TextureButton

export var powerup = "res://Pegs/Yellow/Powerups/Scattershot/Scattershot.tscn"

var spawn_position = Vector2() setget set_spawn_position, get_spawn_position

func _ready() -> void:
	$AnimationPlayer.play("Show")

func set_spawn_position(value):
	spawn_position = value

func get_spawn_position():
	return spawn_position


func _on_TextureButton_pressed() -> void:
	get_tree().paused = false
	
	GameStats.current_powerup = powerup
	GameStats.pick_powerup()

	queue_free()
