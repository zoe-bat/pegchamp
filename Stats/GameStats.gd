extends Node

signal balls_changed()

var max_balls = 4
var balls_left
var pinks_left = 0
var level_won = false
var current_stage = "res://Stages/EmptyStage.tscn"

func add_balls(balls):
	balls_left += balls
	decide_game()
	emit_signal("balls_changed")

func decide_game():
	# game is won
	if (pinks_left <= 0):
		var main = get_tree().current_scene
		var Winscreen = preload("res://Menu/WinScreen.tscn")
		var winscreen = Winscreen.instance()
		main.add_child(winscreen)
	# game is lost
	elif (balls_left <= 0):
		restart_level()

func restart_level():
	var main = get_tree().current_scene
	var Fadeout = load("res://Effects/FadeOut.tscn")
	var fadeout = Fadeout.instance()
	fadeout.scene_to_load = current_stage
	main.add_child(fadeout)
	
	pinks_left = 0
	level_won = false
