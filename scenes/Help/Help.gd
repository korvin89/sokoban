extends Node2D


const PAGES = [
	"_controls_page",
	"_boxes_page",
	"_hint_1_page",
]

onready var _skip_btn: TextureButton = $BoardContainer/SkipBtn
onready var _prev_btn: TextureButton = $BoardContainer/PrevBtn
onready var _next_btn: TextureButton = $BoardContainer/NextBtn
onready var _play_btn: TextureButton = $BoardContainer/PlayBtn
onready var _controls_page: Node2D = $BoardContainer/ControlsPage
onready var _boxes_page: Node2D = $BoardContainer/BoxesPage
onready var _hint_1_page: Node2D = $BoardContainer/Hint1Page

var _page: int = 0
var _help_shown: bool = DataManager.get_data(Shared.DATA_KEY.HELP_SHOWN)


func _ready() -> void:
	if not self._help_shown:
		self._prev_btn.visible = false
	
	self._show_selected_page()


func _set_next_page(step: int) -> void:
	var next_page: int = self._page + step
	
	if next_page < 0:
		next_page = PAGES.size() - 1
		
	if next_page >= PAGES.size():
		next_page = 0
		
	if next_page == PAGES.size() - 1 and not self._help_shown:
		self._next_btn.visible = false
		self._skip_btn.visible = false
		self._play_btn.visible = true
		
	self._page = next_page


func _show_selected_page() -> void:
	var index: int = 0
	
	for page in PAGES:
		if index == self._page:
			self[page].visible = true
		else:
			self[page].visible = false
			
		index += 1


func _start_first_game() -> void:
	var level_id: String = LevelData.LEVELS[0].id
	DataManager.set_data(Shared.DATA_KEY.HELP_SHOWN, true)
	EventBus.emit_signal(Shared.SIGNAL.START_GAME, level_id)


func _on_SkipBtn_pressed() -> void:
	if self._help_shown:
		EventBus.emit_signal(Shared.SIGNAL.OPEN_MENU)
	else:
		self._start_first_game()
	
	
func _on_PrevBtn_pressed() -> void:
	self._set_next_page(-1)
	self._show_selected_page()


func _on_NextBtn_pressed() -> void:
	self._set_next_page(1)
	self._show_selected_page()


func _on_PlayBtn_pressed() -> void:
	self._start_first_game()
