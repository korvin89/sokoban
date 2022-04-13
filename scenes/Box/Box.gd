extends "res://scenes/MovableEntity/MovableEntity.gd"

class_name Box


onready var _sprite = $Sprite

var _box_type: int = Shared.BoxType.Carton
var _succeed: bool = false
var _entered: bool = false


func _ready() -> void:
	self.set_meta("type", Shared.META.MOVABLE)


func move(offset: Vector2) -> void:
	.move(offset)
	self._set_succeed(false)
	# This scratch needs for emitting signal after _on_Box_area_entered invocation
	yield(get_tree().create_timer(0.1), "timeout")
	EventBus.emit_signal(Shared.SIGNAL.MOVE_BOX)


func get_box_type() -> int:
	return self._box_type


func set_box_type(next_box_type: int) -> void:
	self._box_type = next_box_type
	
	match next_box_type:
		Shared.BoxType.Carton:
			self._sprite.frame = Shared.TILE.CARTON_BOX
		Shared.BoxType.Battery:
			self._sprite.frame = Shared.TILE.BATTERY_BOX


func get_succeed() -> bool:
	return self._succeed


func _set_succeed(value: bool) -> void:
	if self._succeed == value:
		return
		
	self._succeed = value
	var next_modulate = Color(0, 1, 0) if value else Color(1, 1, 1)
	self._sprite.modulate = next_modulate


func _on_Box_area_entered(area: Area2D) -> void:
	var is_succeed: bool = false
	
	if area.has_meta("type") and area.get_meta("type") == Shared.META.POINT:
		is_succeed = area.get_box_type() == self.get_box_type()

	self._set_succeed(is_succeed)


