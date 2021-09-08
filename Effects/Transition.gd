extends CanvasLayer

onready var animation = $AnimationPlayer

func _ready():
	animation.play("FadeIn")
	$TransitionSprite.visible = true

func finish_animation():
	queue_free()
