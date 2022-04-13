extends "res://misc/TextureButton.gd"

class_name LevelsButton


const LETTERS = ["_letter_1", "_letter_2"]

onready var _letter_1: TextureRect = $VBoxContainer/HBoxContainer/Letter1
onready var _letter_2: TextureRect = $VBoxContainer/HBoxContainer/Letter2

var _level_id: String


func initialize(data: Dictionary) -> void:
	self._level_id = data.id
	self._create_text()


func _create_text() -> void:
	var index: int = 0

	for letter in self._level_id:
		var texture: Texture = Text.letter_to_texture(letter)
		self[LETTERS[index]].texture = texture
		index += 1


func _on_LevelsButton_button_down():
	EventBus.emit_signal(Shared.SIGNAL.START_GAME, self._level_id)
