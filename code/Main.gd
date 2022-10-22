extends Node
class_name Main

onready var score = $Score

var score_value = 0 setget set_score_value

func set_score_value(value):
	score_value = value
	score.text = "Score = " + str(score_value)

func update_save_data():
	var save_data = SaveState.load_data()
	if score_value > save_data.current_highscore:
		save_data.current_highscore = score_value
		SaveState.save_data(save_data)
		

func _on_Player_player_death():
	yield(get_tree().create_timer(1), "timeout")
	
	update_save_data()
	
	var _error = get_tree().change_scene("res://GameOverScreen.tscn")
	if _error != OK:
		push_error("Failed to change scene: %s" % str(_error))
