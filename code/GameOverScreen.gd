extends Node

onready var highscore_label = $HighScoreLabel

func _ready():
	var save_data = SaveState.load_data()
	highscore_label.text = "Highscore : %d" % save_data.current_highscore

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		var _error = get_tree().change_scene("res://StartMenu.tscn")
		if _error != OK:
			push_error("Failed to change scene: %s" % str(_error))
