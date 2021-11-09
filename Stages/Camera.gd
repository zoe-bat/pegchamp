extends Camera2D
func _ready() -> void:
	global_position = Vector2(384 / 2, -102)

func _process(_delta):
	if GameStats.camera_fx:
		var zoomlevel = clamp(Engine.time_scale, 0.65, 0.975)
		zoom = lerp(zoom, Vector2(zoomlevel, zoomlevel), smoothing_speed / 200)
	else: zoom = Vector2(1, 1)
