extends Node2D

func _ready():
	$AnimationPlayer.play("show")
	$Label.text = "+" + String(GameStats.bonus_points)
