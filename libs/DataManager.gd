extends Node


const FILE_PATH = "user://game_data.txt"

var start_game_data = {
	Shared.DATA_KEY.VERSION: "0.1.0",
	Shared.DATA_KEY.MODE: Shared.MODE.MEDIUM,
	Shared.DATA_KEY.HELP_SHOWN: false,
	Shared.DATA_KEY.UNLOCKED_LEVELS: [
		{
			"id": "1",
			"modes": [
				Shared.MODE.EASY,
				Shared.MODE.MEDIUM,
				Shared.MODE.HARD,
			],
		},
	],
}
var _game_data


func _ready():
	self._load_data()


func get_data(key: String):
	if not self._is_game_data_exist():
		return

	return self._game_data[key]
 
 
func set_data(key: String, value):
	if not _is_game_data_exist():
		return

	self._game_data[key] = value


func save_data():
	self._save_data(self._game_data)


func _save_data(data):
	var file = File.new()
	file.open(FILE_PATH, File.WRITE)
	file.store_line(to_json(data))
	file.close()


func _load_data():
	var file = File.new()

	if not file.file_exists(FILE_PATH):
		print("CREATE NEW DATA ", start_game_data)
		self._game_data = start_game_data
		self._save_data(self._game_data)
		file.close()
		return

	file.open(FILE_PATH, File.READ)
	self._game_data = parse_json(file.get_line())
	print("LOADED_DATA", self._game_data)
	file.close()


func _is_game_data_exist():
	if self._game_data == null:
		print("THERE IS NO LEVEL DATA")
		return false

	return true


func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		print("QUIT GAME", self._game_data)
		self.save_data()











