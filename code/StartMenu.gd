extends Node


func change_to_main_scene():
	get_tree().change_scene("res://Main.tscn")
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		change_to_main_scene()
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func _on_Button_pressed():
	change_to_main_scene()
