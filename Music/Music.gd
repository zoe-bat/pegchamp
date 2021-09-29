extends AudioStreamPlayer

func _process(_delta):
	var speed = clamp(Engine.time_scale, 0.99, 1.1)
	pitch_scale = lerp(pitch_scale, speed, 0.01)
