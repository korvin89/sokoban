extends Area2D

class_name Point


onready var _sprite = $Sprite
var _box_type: int = Shared.BoxType.Carton


func _ready() -> void:
	self.set_meta("type", Shared.META.POINT)


func get_box_type() -> int:
	return self._box_type


func set_box_type(next_box_type: int) -> void:
	self._box_type = next_box_type
	
	match next_box_type:
		Shared.BoxType.Carton:
			self._sprite.frame = Shared.TILE.CARTON_POINT
		Shared.BoxType.Battery:
			self._sprite.frame = Shared.TILE.BATTERY_POINT



