extends Node2D


var BOX = preload("res://scenes/Box/Box.tscn")
var PLAYER = preload("res://scenes/Player/Player.tscn")
var POINT = preload("res://scenes/Point/Point.tscn")

onready var _controls = $Controls

var tilemap: TileMap
var player: Player
var boxes = []
var level_data
var attempts


func _ready() -> void:
	self.level_data = LevelData.get_level_data()
	self._init_attempts()
	self._add_tilemap()
	self._add_player()
	self._add_boxes()
	self._add_points()
	
	EventBus.connect(Shared.SIGNAL.MOVE_BOX, self, "_on_move_box")


func _process(_delta) -> void:
	self._handle_input()


func _handle_input() -> void:
	var left_pressed = Input.is_action_just_pressed("ui_left")
	var right_pressed = Input.is_action_just_pressed("ui_right")
	var up_pressed = Input.is_action_just_pressed("ui_up")
	var down_pressed = Input.is_action_just_pressed("ui_down")
	
	if left_pressed:
		self.player.attempt_to_move(Shared.Dir.Left)
	elif right_pressed:
		self.player.attempt_to_move(Shared.Dir.Right)
	elif up_pressed:
		self.player.attempt_to_move(Shared.Dir.Up)
	elif down_pressed:
		self.player.attempt_to_move(Shared.Dir.Down)


func _init_attempts() -> void:
	var user_mode: String = DataManager.get_data(Shared.DATA_KEY.MODE)
	self.attempts = LevelData.get_level_data().attempts[user_mode]
	
	if self.attempts != null:
		self._controls.set_attempts_label_visibility(true)
		self._controls.set_attempts_label_text(self.attempts)


func _add_tilemap() -> void:
	self.tilemap = level_data.scene.instance()
	self.tilemap.set_meta("type", Shared.META.TILEMAP)
	self.add_child(self.tilemap)
	var tw = self.tilemap.get_used_rect().size.x * Shared.TILE_SIZE
	var th = self.tilemap.get_used_rect().size.y * Shared.TILE_SIZE
	var tp = Vector2(
	# warning-ignore:integer_division
		Shared.SCREEN_WIDTH / 2 - tw / 2,
		(Shared.SCREEN_HEIGHT - th) / 2
	)
	self.tilemap.position = Vector2(tp)


func _add_player() -> void:
	self.player = PLAYER.instance()
	self.tilemap.add_child(player)
	self.player.position = self.tilemap.map_to_world(level_data.player_pos)


func _add_boxes() -> void:
	for box in self.level_data.boxes:
		var box_item = BOX.instance()
		self.boxes.push_back(box_item)
		self.tilemap.add_child(box_item)
		box_item.set_box_type(box.type)
		box_item.position = self.tilemap.map_to_world(box.position)


func _add_points() -> void:
	for point in self.level_data.points:
		var point_item = POINT.instance()
		self.tilemap.add_child(point_item)
		point_item.set_box_type(point.type)
		point_item.position = self.tilemap.map_to_world(point.position)


func _is_level_complete() -> bool:
	var level_complete = true
	
	for box in self.boxes:
		var is_succeed = box.get_succeed()
		
		if not is_succeed:
			level_complete = false
			break
		
	return level_complete


func _on_move_box() -> void:
	var user_mode: String = DataManager.get_data(Shared.DATA_KEY.MODE)
	var level_complete = self._is_level_complete()
	
	if user_mode != Shared.MODE.EASY:
		self.attempts -= 1
		
		if self.attempts == 0 and not level_complete:
			EventBus.emit_signal(Shared.SIGNAL.RESTART_LEVEL)
			return
	
		self._controls.set_attempts_label_text(self.attempts)

	if level_complete:
		EventBus.emit_signal(Shared.SIGNAL.COMPLETE_LEVEL)






















