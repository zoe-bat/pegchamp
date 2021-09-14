extends CanvasLayer

onready var animation = $AnimationPlayer

func _ready():
	$TransitionSprite.visible = true
	animation.play("FadeIn")

func finish_animation():
	queue_free()
