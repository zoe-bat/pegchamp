extends Sprite

func _ready() -> void:
	$AudioStreamPlayer2D.pitch_scale = rand_range(0.5, 1.5)

func animate_hit():
	$AnimationPlayer.play("Spring")

func animate_spawn(delay):
		var timer = Timer.new()
		timer.connect("timeout", self, "play_spawn_animation")
		timer.one_shot = true
		add_child(timer)
		timer.start(delay * 0.02)

func play_spawn_animation():
	$AnimationPlayer.play("Spawn")
