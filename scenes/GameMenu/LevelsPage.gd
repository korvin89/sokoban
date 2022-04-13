extends Node2D


const LINE_SIZE = 3
const LINES_COUNT = 4
const PAGE_SIZE = LINE_SIZE * LINES_COUNT
const LINE_NODES = ["_line_1", "_line_2", "_line_3", "_line_4"]

onready var _line_1: HBoxContainer = $VBoxContainer/Line1
onready var _line_2: HBoxContainer = $VBoxContainer/Line2
onready var _line_3: HBoxContainer = $VBoxContainer/Line3
onready var _line_4: HBoxContainer = $VBoxContainer/Line4
onready var _prev_btn: TextureButton = $PrevBtn
onready var _next_btn: TextureButton = $NextBtn

var LEVELS_BUTTON = preload("res://scenes/GameMenu/LevelsButton.tscn")

var _rendered_buttons: Array = []
var _page: int


func _ready() -> void:
	self.set_page(0)


func set_page(next_page: int) -> void:
	self._page = next_page
	self._prev_btn.disabled = next_page == 0
	self._next_btn.disabled = self._get_sliced_levels().size() < PAGE_SIZE
	self._clean_rendered_buttons()
	self._render_levels_page()


func _get_sliced_levels() -> Array:
	var begin: int = self._page * PAGE_SIZE
	var end: int = begin + PAGE_SIZE - 1
	
	return LevelData.LEVELS.slice(begin, end)


func _get_unlocked_level(level: Dictionary) -> Dictionary:
	var unlocked_levels: Array = DataManager.get_data(Shared.DATA_KEY.UNLOCKED_LEVELS)
	var finded_level: Dictionary
	
	for unlocked_level in unlocked_levels:
		if unlocked_level.id == level.id:
			finded_level = unlocked_level
			break
		
	return finded_level


func _is_level_disabled(level: Dictionary) -> bool:
	var mode: String = DataManager.get_data(Shared.DATA_KEY.MODE)
	var unlocked_level: Dictionary = self._get_unlocked_level(level)
	
	if unlocked_level.empty():
		return true
	
	return not unlocked_level.modes.has(mode)


func _render_levels_page() -> void:
	var line_volume: int = 0
	var line_node_index: int = 0
	
	for level in self._get_sliced_levels():
		var btn: LevelsButton = LEVELS_BUTTON.instance()
		var line_node = LINE_NODES[line_node_index]
		self._rendered_buttons.push_back(btn)
		self[line_node].add_child(btn)
		btn.initialize(level)
		btn.disabled = self._is_level_disabled(level)
		
		line_volume += 1
		
		if line_volume == LINE_SIZE:
			line_volume = 0
			line_node_index += 1


func _clean_rendered_buttons() -> void:
	for button in self._rendered_buttons:
		button.queue_free()
		
	self._rendered_buttons = []


func _on_PrevBtn_pressed():
	self.set_page(self._page - 1)


func _on_NextBtn_pressed():
	self.set_page(self._page + 1)





