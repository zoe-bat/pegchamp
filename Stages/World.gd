extends Node2D

export var stage_name = "test stage"

func _physics_process(_delta):
	fast_forward()

func fast_forward():
	if (Input.is_action_pressed("fast_forward")):
		Engine.time_scale = 3
	if (Input.is_action_just_released("fast_forward")):
		Engine.time_scale = 1
