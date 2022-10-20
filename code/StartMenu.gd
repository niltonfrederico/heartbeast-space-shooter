extends Node


func change_to_main_scene():
	get_tree().change_scene("res://Main.tscn")
	
func _input(event):
	if event is InputEventKey and event.is_pressed():
		change_to_main_scene()

func _on_Button_pressed():
	change_to_main_scene()
