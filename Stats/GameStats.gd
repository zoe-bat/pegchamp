extends Node

signal balls_changed()
signal current_stage_changed(scene)
signal multiplier_changed(value)
signal score_changed(value)
signal powerup_picked()
signal recount_pink()
signal pink_changed(value)
signal game_won()
signal win_animation_finished()

var unlock_points = 10
var max_balls = 3
var balls_left
var pinks_left = 0
var level_won = false
var current_stage = "res://Stages/EmptyStage.tscn"
var multiplier = 1
var score = 0
var camera_fx = true
var bonus_points = 0
var best_combo = 1
# is here to prevent multiple powerups from spawning 
# if only one of them should be there
var powerup_screen_active = false
var current_powerup = "res://Pegs/Yellow/Powerups/Scattershot/Scattershot.tscn"
var stage_powerup = "res://Pegs/Yellow/PowerupCards/Scattershot.tscn"
var powerup_active = false

func add_balls(balls):
	balls_left += balls
	decide_game()
	emit_signal("balls_changed")

func decide_game():
	# game is won
	if (pinks_left <= 0):

		while balls_left > 0:
			bonus_points += 15
			balls_left -= 1
		score += bonus_points
		emit_signal("balls_changed")
		emit_signal("score_changed", score)
		
		var main = get_tree().current_scene
		var BallsLeftLabel = preload("res://HUD/BallsLeftLabel.tscn")
		var balls_left_label = BallsLeftLabel.instance()
		main.add_child(balls_left_label)
		
		var Winscreen = preload("res://Menu/WinScreen.tscn")
		var winscreen = Winscreen.instance()
		main.add_child(winscreen)
		emit_signal("game_won")

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
	multiplier = 1
	score = 0
	balls_left = max_balls
	pinks_left = 0
	level_won = false
	bonus_points = 0
	emit_signal("balls_changed")

	
func set_current_scene(stage):
	current_stage = stage
	emit_signal("current_stage_changed", current_stage)
	print(stage)
	
func add_to_multiplier(value):
	if value + GameStats.multiplier > GameStats.multiplier:
		var SFXPlayer = load("res://SFX/SFXPlayer.tscn")
		var sfx_player = SFXPlayer.instance()
		var main = get_tree().current_scene
		main.add_child(sfx_player)
	
	multiplier += value
	emit_signal("multiplier_changed", multiplier)

func set_multiplier(value):
	multiplier = value
	emit_signal("multiplier_changed", multiplier)


func set_score_to(value):
	score = value
	emit_signal("score_changed", score)

func pick_powerup():
	powerup_screen_active = false
	emit_signal("powerup_picked")

func recount_pink():
	pinks_left = 0;
	emit_signal("recount_pink")
	pinks_left -= 1
	emit_signal("pink_changed", pinks_left)
