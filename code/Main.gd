extends Node
class_name Main

onready var score = $Score

var score_value = 0 setget set_score_value

func set_score_value(value):
	score_value = value
	score.text = "Score = " + str(score_value)
