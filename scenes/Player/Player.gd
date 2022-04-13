extends "res://scenes/MovableEntity/MovableEntity.gd"

class_name Player


const FRAME = {
	"DOWN": 9,
	"RIGHT": 26,
	"UP": 43,
	"LEFT": 60,
}

onready var _sprite: Sprite = $Sprite


func _ready() -> void:
	self._sprite.frame = FRAME.DOWN


func _set_fram_by_direction(direction: int) -> void:
	var next_frame: int
	
	match direction:
		Shared.Dir.Down:
			next_frame = FRAME.DOWN
		Shared.Dir.Right:
			next_frame = FRAME.RIGHT
		Shared.Dir.Up:
			next_frame = FRAME.UP
		Shared.Dir.Left:
			next_frame = FRAME.LEFT
			
	self._sprite.frame = next_frame


func attempt_to_move(direction: int) -> void:
	var offset = null
	var can_move: bool = false
	var collider = self.get_collider_by_dir(direction)
	
	if collider != null:
		var type = collider.get_meta("type")
		
		if type == Shared.META.MOVABLE:
			var colliders_collider = collider.get_collider_by_dir(direction)
			
			if colliders_collider == null:
				var collider_offset = collider.get_pos_offset_by_dir(direction)
				collider.move(collider_offset)
				can_move = true

			
	if collider == null or can_move:
		offset = self.get_pos_offset_by_dir(direction)
		
	if offset != null:
		self.move(offset)
		
	self._set_fram_by_direction(direction)










