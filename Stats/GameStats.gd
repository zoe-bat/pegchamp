extends Node

signal balls_changed()
signal current_stage_changed(scene)

var unlock_points = 10
var max_balls = 8
var balls_left
var pinks_left = 0
var level_won = false
var current_stage = "res://Stages/EmptyStage.tscn"
var multiplier = 1
var score = 0

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
	reset_board()

func reset_board():
	balls_left = max_balls
	pinks_left = 0
	level_won = false
	multiplier = 1
	score = 0
	
func set_current_scene(stage):
	current_stage = stage
	emit_signal("current_stage_changed", current_stage)
	
func add_to_multiplier():
	var SFXPlayer = load("res://SFX/SFXPlayer.tscn")
	var sfx_player = SFXPlayer.instance()
	var main = get_tree().current_scene
	main.add_child(sfx_player)
	multiplier += 1
