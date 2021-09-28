extends CanvasLayer

onready var animation = $AnimationPlayer

func _ready():
	$TransitionSprite.visible = true
	animation.play("FadeIn")
	$FadeInSound.play(0)

func finish_animation():
	queue_free()
