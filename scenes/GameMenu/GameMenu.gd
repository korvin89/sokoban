extends Node2D


enum State {Start, Options, Levels}

const LEVEL_FORMAT_STR = "Level %s"
const NODES = {
	"PLAY_BTN": "_play_btn",
	"LVL_BTN": "_lvl_btn",
	"OPT_BTN": "_opt_btn",
	"HELP_BTN": "_help_btn",
	"BACK_BTN": "_back_btn",
	"MAIN_MENU_HEADER": "_main_menu_header",
	"OPT_HEADER": "_opt_header",
	"MODE_OPT": "_mode_opt",
	"LVL_HEADER": "_lvl_header",
	"LVL_PAGE": "_lvl_page",
}

onready var _play_btn: TextureButton = $Container/PlayBtn
onready var _lvl_btn: TextureButton = $Container/LvlBtn
onready var _opt_btn: TextureButton = $Container/OptBtn
onready var _help_btn: TextureButton = $Container/HelpBtn
onready var _back_btn: TextureButton = $Container/BackBtn
onready var _main_menu_header: Node2D = $Container/MainMenuHeader
onready var _opt_header: Node2D = $Container/OptHeader
onready var _mode_opt: Node2D = $Container/ModeOption
onready var _lvl_header: Node2D = $Container/LvlHeader
onready var _lvl_page: Node2D = $Container/LevelsPage

var _ui_nodes: Array = [
	NODES.PLAY_BTN,
	NODES.LVL_BTN,
	NODES.OPT_BTN,
	NODES.HELP_BTN,
	NODES.BACK_BTN,
	NODES.MAIN_MENU_HEADER,
	NODES.OPT_HEADER,
	NODES.MODE_OPT,
	NODES.LVL_HEADER,
	NODES.LVL_PAGE,
]
var _state: int = State.Start
var _prev_state: int = State.Start


func _ready():
	self._set_state(State.Start)


# TODO: move this method to parent class
func _change_ui_nodes_visibility(visible_nodes: Array) -> void:
	for node in self._ui_nodes:
		self[node].visible = visible_nodes.has(node)


func _get_last_available_level_id() -> String:
	var mode: String = DataManager.get_data(Shared.DATA_KEY.MODE)
	var unlocked_levels: Array = DataManager.get_data(Shared.DATA_KEY.UNLOCKED_LEVELS)
	# It needs to prevent array`s mutation in main data
	var inverted_unlocked_levels = unlocked_levels.slice(0, unlocked_levels.size() - 1)
	var level_id: String = "1"
	inverted_unlocked_levels.invert()
	
	for level in inverted_unlocked_levels:
		if level.modes.has(mode):
			level_id = level.id
			break

	return level_id


func _set_state(next_state: int) -> void:
	self._prev_state = self._state
	self._state = next_state

	match next_state:
		State.Start:
			var help_shown: bool = DataManager.get_data(Shared.DATA_KEY.HELP_SHOWN)
			var visible_nodes: Array = [
				NODES.PLAY_BTN,
				NODES.LVL_BTN,
				NODES.OPT_BTN,
				NODES.MAIN_MENU_HEADER,
			]
			
			if help_shown:
				visible_nodes.push_front(NODES.HELP_BTN)
				
			self._change_ui_nodes_visibility(visible_nodes)
		State.Options:
			self._change_ui_nodes_visibility([
				NODES.BACK_BTN,
				NODES.OPT_HEADER,
				NODES.MODE_OPT,
			])
		State.Levels:
			self._change_ui_nodes_visibility([
				NODES.BACK_BTN,
				NODES.LVL_HEADER,
				NODES.LVL_PAGE,
			])
			self[NODES.LVL_PAGE].set_page(0)


func _on_BackBtn_pressed():
	self._set_state(self._prev_state)


func _on_OptBtn_pressed():
	self._set_state(State.Options)


func _on_LvlBtn_pressed():
	self._set_state(State.Levels)


func _on_PlayBtn_pressed():
	var help_shown: bool = DataManager.get_data(Shared.DATA_KEY.HELP_SHOWN)
	
	if help_shown:
		var level_id: String = self._get_last_available_level_id()
		EventBus.emit_signal(Shared.SIGNAL.START_GAME, level_id)
	else:
		EventBus.emit_signal(Shared.SIGNAL.OPEN_HELP)


func _on_HelpBtn_pressed():
	EventBus.emit_signal(Shared.SIGNAL.OPEN_HELP)

