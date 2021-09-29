extends Node2D

export var base_score = 1

func trigger():
	add_score()

func add_score():
	var score = base_score * GameStats.multiplier
	GameStats.score += score
	
	#Todo remove
	print(GameStats.score)
	
	
	var main = get_tree().current_scene
	var Scorelabel = preload("res://Pegs/ScoreLabel.tscn")
	var scorelabel = Scorelabel.instance()
	main.add_child(scorelabel)
	scorelabel.global_position = global_position
	scorelabel.trigger(String(score))
	
func delete():
	queue_free()

