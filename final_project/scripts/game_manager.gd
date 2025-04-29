extends Node

var score = 0
@onready var score_label = $ScoreLabel

func add_point():
	score += 1
	score_label.text = "You collected " + str(score) + " coins."
	
func game_over():
	# Change to the game over scene
	get_tree().change_scene_to_file("res://scenes/gameover.tscn")
