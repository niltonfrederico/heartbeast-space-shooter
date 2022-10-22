extends Node
class_name Main

onready var score = $Score

var score_value = 0 setget set_score_value

func set_score_value(value):
	score_value = value
	score.text = "Score = " + str(score_value)

func _on_Player_player_death():
	yield(get_tree().create_timer(1), "timeout")
	
	get_tree().change_scene("res://GameOverScreen.tscn")
