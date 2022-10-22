extends Node


func change_to_main_scene():
	var _error = get_tree().change_scene("res://Main.tscn")
	if _error != OK:
		push_error("Failed to change scene: %s" % str(_error))
	
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		change_to_main_scene()
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func _on_Button_pressed():
	change_to_main_scene()
