extends Control


const DIGITS = ["_digit_1", "_digit_2", "_digit_3"]
const SWIPE_SPEED = 250

onready var _menu_btn: TextureButton = $MenuBtn
onready var _left_btn: TouchScreenButton = $Left
onready var _attempts: Node2D = $Attempts
onready var _digit_1: TextureRect = $Attempts/HBoxContainer/Digit1
onready var _digit_2: TextureRect = $Attempts/HBoxContainer/Digit2
onready var _digit_3: TextureRect = $Attempts/HBoxContainer/Digit3

var _swipe_triggered: bool = false
var _touched: bool = false


func _input(e) -> void:
	self._handle_touch_input(e)
	self._handle_keys_input()


func set_attempts_label_visibility(visible: bool) -> void:
	self._attempts.visible = visible


func set_attempts_label_text(attempts: int) -> void:
	var index: int = 0
	
	for digit in DIGITS:
		self[digit].texture = null

	for letter in String(attempts):
		var texture: Texture = Text.letter_to_texture(letter)
		self[DIGITS[index]].texture = texture
		index += 1


func _handle_keys_input() -> void:
	var esc_pressed: bool = Input.is_action_just_pressed("ui_cancel")
	var retry_pressed: bool = Input.is_action_just_pressed("ui_retry")
	
	if esc_pressed:
		EventBus.emit_signal(Shared.SIGNAL.OPEN_MENU)

	if retry_pressed:
		EventBus.emit_signal(Shared.SIGNAL.RESTART_LEVEL)


func _handle_touch_input(e: Object) -> void:
	if e is InputEventScreenTouch:
		self._touched = e.pressed
		
		if not self._touched:
			self._swipe_triggered = false

	if not self._touched:
		return
	
	if e is InputEventScreenDrag and not self._swipe_triggered:
		if e.speed.y < -SWIPE_SPEED:
			self._swipe_triggered = true
			Input.action_press("ui_up")
		elif e.speed.y > SWIPE_SPEED:
			self._swipe_triggered = true
			Input.action_press("ui_down")
		elif e.speed.x < -SWIPE_SPEED:
			self._swipe_triggered = true
			Input.action_press("ui_left")
		elif e.speed.x > SWIPE_SPEED:
			self._swipe_triggered = true
			Input.action_press("ui_right")


func _on_RetryBtn_pressed():
	EventBus.emit_signal(Shared.SIGNAL.RESTART_LEVEL)


func _on_MenuBtn_pressed():
	EventBus.emit_signal(Shared.SIGNAL.OPEN_MENU)
