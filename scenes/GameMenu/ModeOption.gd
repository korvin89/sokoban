extends Node2D


enum ModeTransition {Prev, Next}

const NODES = {
	"EASY_LABEL": "_easy_label",
	"MEDIUM_LABEL": "_medium_label",
	"HARD_LABEL": "_hard_label",
}
const MODES = [
	Shared.MODE.EASY,
	Shared.MODE.MEDIUM,
	Shared.MODE.HARD,
]

onready var _prev_btn: TextureButton = $PrevBtn
onready var _next_btn: TextureButton = $NextBtn
onready var _easy_label: Node2D = $EasyLabel
onready var _medium_label: Node2D = $MediumLabel
onready var _hard_label: Node2D = $HardLabel

var _ui_nodes: Array = [
	NODES.EASY_LABEL,
	NODES.MEDIUM_LABEL,
	NODES.HARD_LABEL,
]
var _mode: String


func _ready() -> void:
	var start_mode = DataManager.get_data(Shared.DATA_KEY.MODE)
	self._set_mode(start_mode)


func _change_ui_nodes_visibility(visible_nodes: Array) -> void:
	for node in self._ui_nodes:
		self[node].visible = visible_nodes.has(node)


func _set_mode(next_mode: String) -> void:
	self._mode = next_mode

	match next_mode:
		Shared.MODE.EASY:
			self._change_ui_nodes_visibility([NODES.EASY_LABEL])
		Shared.MODE.MEDIUM:
			self._change_ui_nodes_visibility([NODES.MEDIUM_LABEL])
		Shared.MODE.HARD:
			self._change_ui_nodes_visibility([NODES.HARD_LABEL])


func _get_next_mode_index(mode_transition: int) -> int:
	var current_index: int = MODES.find(self._mode)
	var last_index: int = MODES.size() - 1
	var next_index: int
	
	match mode_transition:
		ModeTransition.Prev:
			var is_first_in_list: bool = current_index == 0
			next_index = last_index if is_first_in_list else current_index - 1
		ModeTransition.Next:
			var is_last_in_list: bool = current_index == last_index
			next_index = 0 if is_last_in_list else current_index + 1

	return next_index


func _handle_button_click(mode_transition: int) -> void:
	var next_mode_index: int = self._get_next_mode_index(mode_transition)
	var next_mode: String = MODES[next_mode_index]
	self._set_mode(next_mode)
	DataManager.set_data(Shared.DATA_KEY.MODE, next_mode)


func _on_PrevBtn_pressed():
	self._handle_button_click(ModeTransition.Prev)


func _on_NextBtn_pressed():
	self._handle_button_click(ModeTransition.Next)











