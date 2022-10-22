extends Node

const SAVE_FILE_PATH = "res://state.json"

var default_save_data = {
	"current_highscore": 0
}

func save_data(save_data: Dictionary):
	var json_string = to_json(save_data)
	
	var save_file = File.new()
	save_file.open(SAVE_FILE_PATH, File.WRITE)
	save_file.store_line(json_string)
	save_file.close()
	
func load_data() -> Dictionary:
	var save_file = File.new()
	
	if not save_file.file_exists(SAVE_FILE_PATH):
		return default_save_data
		
	save_file.open(SAVE_FILE_PATH, File.READ)
	var json_string = parse_json(save_file.get_as_text())
	
	save_file.close()
	
	return json_string

func get_highscore() -> int:
	return default_save_data.current_highscore
