extends TextureButton


const NORMAL_COLOR = Color(1, 1, 1, 1)
const HOVERED_COLOR = Color(0.75, 0.75, 0.75, 1)
const DISABLED_COLOR = Color(1, 1, 1, 0.6)
const NORMAL_SCALE = Vector2(1, 1)
const PRESSED_SCALE = Vector2(0.96, 0.96)

var _touch_device: bool = OS.has_touchscreen_ui_hint()
var _normal_color: Color
var _hovered: bool = false
var _pressed: bool = false
var _disabled: bool = false


func _ready() -> void:
	var width = self.rect_size.x
	var height = self.rect_size.y
	self.rect_pivot_offset = Vector2(width / 2, height / 2)
	self._normal_color = self.modulate


func _process(_delta) -> void:
	if self._disabled:
		self._handle_disabled_state()
		return
		
	self._handle_disabled_state()
	self._handle_hovered_state()
	self._handle_active_state()


func _handle_disabled_state() -> void:
	var is_disabled_now = self.disabled
	
	if is_disabled_now == self._disabled:
		return
		
	var next_modulate: Color = DISABLED_COLOR if is_disabled_now else self._normal_color
	self._disabled = is_disabled_now
	self.modulate = next_modulate


func _handle_hovered_state() -> void:
	if self._touch_device:
		return
	
	var is_hovered_now = self.is_hovered()
	
	if is_hovered_now == self._hovered:
		return
	
	var next_modulate: Color = HOVERED_COLOR if is_hovered_now else self._normal_color
	self._hovered = is_hovered_now
	self.modulate = next_modulate
	

func _handle_active_state() -> void:
	var is_pressed_now = self.pressed
	
	if is_pressed_now == self._pressed:
		return
	
	var next_scale: Vector2 = PRESSED_SCALE if is_pressed_now else NORMAL_SCALE
	self._pressed = is_pressed_now
	self.rect_scale = next_scale












