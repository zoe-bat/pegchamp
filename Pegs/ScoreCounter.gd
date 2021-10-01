extends Node2D

export var base_score = 1
export var base_multiplier = 1

func trigger():
	add_score()
	add_multiplier()

func add_score():
	var score = base_score * GameStats.multiplier
	
	GameStats.set_score_to(GameStats.score + base_score * GameStats.multiplier)
	
	var main = get_tree().current_scene
	var Scorelabel = preload("res://Pegs/ScoreLabel.tscn")
	var scorelabel = Scorelabel.instance()
	main.add_child(scorelabel)
	scorelabel.global_position = global_position
	scorelabel.trigger(String(score))

func add_multiplier():
	GameStats.add_to_multiplier(base_multiplier)

func delete():
	queue_free()

