extends Area2D

class_name MovableEntity


onready var ray_left: RayCast2D = $RayLeft
onready var ray_right: RayCast2D = $RayRight
onready var ray_up: RayCast2D = $RayUp
onready var ray_down: RayCast2D = $RayDown


func move(offset: Vector2) -> void:
	self.position.x += offset.x
	self.position.y += offset.y


func get_collider_by_dir(direction: int) -> Object:
	var collider = null
	
	match direction:
		Shared.Dir.Left:
			collider = ray_left.get_collider()
		Shared.Dir.Right:
			collider = ray_right.get_collider()
		Shared.Dir.Up:
			collider = ray_up.get_collider()
		Shared.Dir.Down:
			collider = ray_down.get_collider()
			
	return collider


func get_pos_offset_by_dir(direction: int) -> Vector2:
	var offset_x = 0
	var offset_y = 0
	
	match direction:
		Shared.Dir.Left:
			offset_x = -Shared.TILE_SIZE
		Shared.Dir.Right:
			offset_x = Shared.TILE_SIZE
		Shared.Dir.Up:
			offset_y = -Shared.TILE_SIZE
		Shared.Dir.Down:
			offset_y = Shared.TILE_SIZE
			
	return Vector2(offset_x, offset_y)











