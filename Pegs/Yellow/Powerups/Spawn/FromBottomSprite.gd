extends AnimatedSprite

var ready_for_delete = false

func play_backwards():
	if ready_for_delete:
		queue_free()
	else:
		play("despawn")
		ready_for_delete = true

