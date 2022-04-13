extends Node


func _ready():
	EventBus.connect(Shared.SIGNAL.START_GAME, self, "_start_game")
	EventBus.connect(Shared.SIGNAL.COMPLETE_LEVEL, self, "_complete_level")
	EventBus.connect(Shared.SIGNAL.RESTART_LEVEL, self, "_restart_level")
	EventBus.connect(Shared.SIGNAL.OPEN_MENU, self, "_open_menu")
	EventBus.connect(Shared.SIGNAL.OPEN_HELP, self, "_open_help")


func _is_completed_last_level() -> bool:
	var level_data: Dictionary = LevelData.get_level_data()
	var index: int = int(level_data.id) - 1
	return index == LevelData.LEVELS.size() - 1


func _get_current_level_index() -> int:
	var level_data = LevelData.get_level_data()
	return int(level_data.id) - 1
	
	
func _get_current_level_id() -> String:
	var level_data = LevelData.get_level_data()
	return level_data.id


func _get_unlocked_level_index(target_id: String) -> int:
	var unlocked_levels: Array = DataManager.get_data(Shared.DATA_KEY.UNLOCKED_LEVELS)
	var unlocked_level_index: int = -1
	var index: int = 0
	
	for level in unlocked_levels:
		if level.id == target_id:
			unlocked_level_index = index
			break
		else:
			index += 1
	
	return unlocked_level_index

# @returns {id: String, index: int}[]
func _get_levels_to_update() -> Array:
	var data: Array = []
	var is_last_level: bool = self._is_completed_last_level()
	var current_level_id: String = self._get_current_level_id()
	var current_level_index: int = self._get_current_level_index()
	
	data.push_back({
		"id": current_level_id,
		"index": current_level_index,
	})
	
	if not is_last_level:
		var next_level_id: String = LevelData.LEVELS[current_level_index + 1].id
		var next_level_index: int = self._get_unlocked_level_index(next_level_id)
		data.push_back({
			"id": next_level_id,
			"index": next_level_index,
		})
	
	return data


func _update_unlocked_level_data(level_id: String, level_index: int) -> void:
	var mode: String = DataManager.get_data(Shared.DATA_KEY.MODE)
	var unlocked_levels: Array = DataManager.get_data(Shared.DATA_KEY.UNLOCKED_LEVELS)
	var next_unlocked_levels = unlocked_levels
	
	match mode:
		Shared.MODE.EASY:
			if level_index == -1:
				next_unlocked_levels.push_back({
					"id": level_id,
					"modes": [Shared.MODE.EASY],
				})
		Shared.MODE.MEDIUM:
			if level_index == -1:
				next_unlocked_levels.push_back({
					"id": level_id,
					"modes": [Shared.MODE.EASY, Shared.MODE.MEDIUM],
				})
			elif not next_unlocked_levels[level_index].modes.has(Shared.MODE.MEDIUM):
				next_unlocked_levels[level_index].modes.push_back(Shared.MODE.MEDIUM)
		Shared.MODE.HARD:
			if level_index == -1:
				next_unlocked_levels.push_back({
					"id": level_id,
					"modes": [Shared.MODE.EASY, Shared.MODE.MEDIUM, Shared.MODE.HARD],
				})
			elif not next_unlocked_levels[level_index].modes.has(Shared.MODE.HARD):
				next_unlocked_levels[level_index].modes.push_back(Shared.MODE.HARD)
				
	DataManager.set_data(Shared.DATA_KEY.UNLOCKED_LEVELS, next_unlocked_levels)


func _update_levels_data() -> void:
	var levels_to_update: Array = self._get_levels_to_update()
	
	for level in levels_to_update:
		self._update_unlocked_level_data(level.id, level.index)


func _start_game(level_id: String) -> void:
	var help_shown: bool = DataManager.get_data(Shared.DATA_KEY.HELP_SHOWN)
	
	if help_shown:
		LevelData.set_level_data(level_id)
		self.get_tree().change_scene("res://scenes/Game.tscn")
	else:
		self._open_help()
		
	


func _complete_level() -> void:
	print("complete level")
	var index = self._get_current_level_index()
	var is_last_level = self._is_completed_last_level()
	
	self._update_levels_data()
	DataManager.save_data()
		
	if is_last_level:
		self.get_tree().change_scene("res://scenes/EndGame/EndGame.tscn")
	else:
		var next_level_data_id = LevelData.LEVELS[index + 1].id
		LevelData.set_level_data(next_level_data_id)
		self.get_tree().reload_current_scene()


func _restart_level() -> void:
	print("restart level")
	self.get_tree().reload_current_scene()


func _open_menu() -> void:
	print("open menu")
	self.get_tree().change_scene("res://scenes/GameMenu/GameMenu.tscn")


func _open_help() -> void:
	print("open help")
	self.get_tree().change_scene("res://scenes/Help/Help.tscn")


