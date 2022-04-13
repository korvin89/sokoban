extends Node


var LEVEL_1 = preload("res://scenes/levels/Level1.tscn")
var LEVEL_2 = preload("res://scenes/levels/Level2.tscn")
var LEVEL_3 = preload("res://scenes/levels/Level3.tscn")
var LEVEL_4 = preload("res://scenes/levels/Level4.tscn")
var LEVEL_5 = preload("res://scenes/levels/Level5.tscn")
var LEVEL_6 = preload("res://scenes/levels/Level6.tscn")
var LEVEL_7 = preload("res://scenes/levels/Level7.tscn")
var LEVEL_8 = preload("res://scenes/levels/Level8.tscn")
var LEVEL_9 = preload("res://scenes/levels/Level9.tscn")
var LEVEL_10 = preload("res://scenes/levels/Level10.tscn")
var LEVEL_11 = preload("res://scenes/levels/Level11.tscn")
var LEVEL_12 = preload("res://scenes/levels/Level12.tscn")
var LEVEL_13 = preload("res://scenes/levels/Level13.tscn")
var LEVEL_14 = preload("res://scenes/levels/Level14.tscn")
var LEVEL_15 = preload("res://scenes/levels/Level15.tscn")

var LEVELS = [
	{
		"id": "1",
		"scene": LEVEL_1,
		"attempts": {
			Shared.MODE.EASY: null,
			Shared.MODE.MEDIUM: 8,
			Shared.MODE.HARD: 5,
		},
		"player_pos": Vector2(2, 4),
		"boxes": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(4, 4)
			},
		],
		"points": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(7, 2)
			},
		],
	},
	{
		"id": "2",
		"scene": LEVEL_2,
		"attempts": {
			Shared.MODE.EASY: null,
			Shared.MODE.MEDIUM: 12,
			Shared.MODE.HARD: 8,
		},
		"player_pos": Vector2(5, 2),
		"boxes": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(2, 2)
			},
		],
		"points": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(5, 5)
			},
		],
	},
	{
		"id": "3",
		"scene": LEVEL_3,
		"attempts": {
			Shared.MODE.EASY: null,
			Shared.MODE.MEDIUM: 24,
			Shared.MODE.HARD: 16,
		},
		"player_pos": Vector2(3, 1),
		"boxes": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(2, 3)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(2, 4)
			},
		],
		"points": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(8, 3)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(8, 4)
			},
		],
	},
	{
		"id": "4",
		"scene": LEVEL_4,
		"attempts": {
			Shared.MODE.EASY: null,
			Shared.MODE.MEDIUM: 34,
			Shared.MODE.HARD: 24,
		},
		"player_pos": Vector2(4, 4),
		"boxes": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(3, 3)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(4, 3)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(5, 3)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(3, 4)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(3, 5)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(4, 5)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(5, 4)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(5, 5)
			},
		],
		"points": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(1, 1)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(4, 1)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(7, 1)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(1, 4)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(1, 7)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(4, 7)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(7, 7)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(7, 4)
			},
		],
	},
	{
		"id": "5",
		"scene": LEVEL_5,
		"attempts": {
			Shared.MODE.EASY: null,
			Shared.MODE.MEDIUM: 10,
			Shared.MODE.HARD: 6,
		},
		"player_pos": Vector2(5, 3),
		"boxes": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(3, 3)
			},
			{
				"type": Shared.BoxType.Battery,
				"position": Vector2(4, 3)
			},
		],
		"points": [
			{
				"type": Shared.BoxType.Battery,
				"position": Vector2(1, 3)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(2, 3)
			},
		],
	},
	{
		"id": "6",
		"scene": LEVEL_6,
		"attempts": {
			Shared.MODE.EASY: null,
			Shared.MODE.MEDIUM: 24,
			Shared.MODE.HARD: 16,
		},
		"player_pos": Vector2(1, 1),
		"boxes": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(2, 3)
			},
		],
		"points": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(8, 1)
			},
		],
	},
	{
		"id": "7",
		"scene": LEVEL_7,
		"attempts": {
			Shared.MODE.EASY: null,
			Shared.MODE.MEDIUM: 70,
			Shared.MODE.HARD: 50,
		},
		"player_pos": Vector2(6, 1),
		"boxes": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(2, 2)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(3, 2)
			},
			{
				"type": Shared.BoxType.Battery,
				"position": Vector2(3, 3)
			},
			{
				"type": Shared.BoxType.Battery,
				"position": Vector2(4, 3)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(4, 4)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(5, 4)
			},
		],
		"points": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(8, 1)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(9, 1)
			},
			{
				"type": Shared.BoxType.Battery,
				"position": Vector2(8, 2)
			},
			{
				"type": Shared.BoxType.Battery,
				"position": Vector2(9, 2)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(8, 3)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(9, 3)
			},
		],
	},
	{
		"id": "8",
		"scene": LEVEL_8,
		"attempts": {
			Shared.MODE.EASY: null,
			Shared.MODE.MEDIUM: 60,
			Shared.MODE.HARD: 36,
		},
		"player_pos": Vector2(2, 2),
		"boxes": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(3, 3)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(5, 3)
			},
			{
				"type": Shared.BoxType.Battery,
				"position": Vector2(3, 8)
			},
			{
				"type": Shared.BoxType.Battery,
				"position": Vector2(5, 8)
			},
		],
		"points": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(4, 4)
			},
			{
				"type": Shared.BoxType.Battery,
				"position": Vector2(4, 5)
			},
			{
				"type": Shared.BoxType.Battery,
				"position": Vector2(4, 6)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(4, 7)
			},
		],
	},
	{
		"id": "9",
		"scene": LEVEL_9,
		"attempts": {
			Shared.MODE.EASY: null,
			Shared.MODE.MEDIUM: 50,
			Shared.MODE.HARD: 28,
		},
		"player_pos": Vector2(5, 4),
		"boxes": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(5, 3)
			},
			{
				"type": Shared.BoxType.Battery,
				"position": Vector2(6, 4)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(5, 5)
			},
			{
				"type": Shared.BoxType.Battery,
				"position": Vector2(4, 4)
			},
		],
		"points": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(1, 1)
			},
			{
				"type": Shared.BoxType.Battery,
				"position": Vector2(9, 1)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(9, 7)
			},
			{
				"type": Shared.BoxType.Battery,
				"position": Vector2(1, 7)
			},
		],
	},
	{
		"id": "10",
		"scene": LEVEL_10,
		"attempts": {
			Shared.MODE.EASY: null,
			Shared.MODE.MEDIUM: 50,
			Shared.MODE.HARD: 33,
		},
		"player_pos": Vector2(5, 6),
		"boxes": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(5, 2)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(5, 3)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(5, 4)
			},
		],
		"points": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(6, 2)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(6, 3)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(6, 4)
			},
		],
	},
	{
		"id": "11",
		"scene": LEVEL_11,
		"attempts": {
			Shared.MODE.EASY: null,
			Shared.MODE.MEDIUM: 100,
			Shared.MODE.HARD: 78,
		},
		"player_pos": Vector2(5, 7),
		"boxes": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(5, 4)
			},
			{
				"type": Shared.BoxType.Battery,
				"position": Vector2(8, 6)
			},
			{
				"type": Shared.BoxType.Battery,
				"position": Vector2(8, 7)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(9, 6)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(10, 7)
			},
		],
		"points": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(1, 1)
			},
			{
				"type": Shared.BoxType.Battery,
				"position": Vector2(1, 2)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(1, 3)
			},
			{
				"type": Shared.BoxType.Battery,
				"position": Vector2(1, 4)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(1, 5)
			},
		],
	},
	{
		"id": "12",
		"scene": LEVEL_12,
		"attempts": {
			Shared.MODE.EASY: null,
			Shared.MODE.MEDIUM: 150,
			Shared.MODE.HARD: 110,
		},
		"player_pos": Vector2(9, 1),
		"boxes": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(8, 3)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(9, 3)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(9, 4)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(9, 5)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(8, 6)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(9, 7)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(8, 8)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(5, 6)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(6, 7)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(5, 8)
			},
		],
		"points": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(1, 1)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(1, 2)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(1, 3)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(1, 4)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(1, 5)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(2, 1)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(2, 2)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(2, 3)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(2, 4)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(2, 5)
			},
		],
	},
	{
		"id": "13",
		"scene": LEVEL_13,
		"attempts": {
			Shared.MODE.EASY: null,
			Shared.MODE.MEDIUM: 160,
			Shared.MODE.HARD: 120,
		},
		"player_pos": Vector2(5, 2),
		"boxes": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(5, 3)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(9, 2)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(10, 2)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(9, 5)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(6, 7)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(4, 7)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(2, 9)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(3, 9)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(2, 7)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(2, 6)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(3, 4)
			},
		],
		"points": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(8, 9)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(9, 9)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(10, 9)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(8, 8)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(9, 8)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(10, 8)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(8, 7)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(9, 7)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(10, 7)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(9, 6)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(10, 6)
			},
		],
	},
	{
		"id": "14",
		"scene": LEVEL_14,
		"attempts": {
			Shared.MODE.EASY: null,
			Shared.MODE.MEDIUM: 300,
			Shared.MODE.HARD: 240,
		},
		"player_pos": Vector2(8, 7),
		"boxes": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(5, 5)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(7, 5)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(9, 5)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(5, 6)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(6, 6)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(8, 6)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(5, 7)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(7, 7)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(9, 7)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(6, 8)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(5, 9)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(7, 9)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(8, 8)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(9, 9)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(9, 11)
			},
		],
		"points": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(3, 13)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(3, 14)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(3, 15)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(4, 13)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(4, 14)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(4, 15)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(5, 13)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(5, 14)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(5, 15)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(6, 13)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(6, 14)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(6, 15)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(7, 13)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(7, 14)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(7, 15)
			},
		],
	},
	{
		"id": "15",
		"scene": LEVEL_15,
		"attempts": {
			Shared.MODE.EASY: null,
			Shared.MODE.MEDIUM: 300,
			Shared.MODE.HARD: 240,
		},
		"player_pos": Vector2(8, 1),
		"boxes": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(6, 2)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(8, 3)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(4, 3)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(2, 4)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(3, 5)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(8, 7)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(2, 8)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(5, 8)
			},
		],
		"points": [
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(4, 4)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(5, 4)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(6, 4)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(4, 5)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(5, 5)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(6, 5)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(4, 6)
			},
			{
				"type": Shared.BoxType.Carton,
				"position": Vector2(6, 6)
			},
		],
	},
]

var _level_data: Dictionary


func get_level_data() -> Dictionary:
	return self._level_data
	
	
func set_level_data(level_id: String) -> void:
	var level = self._get_level_data_by_id(level_id)
	self._level_data = level.data


func _get_level_data_by_id(id: String) -> Dictionary:
	var data
	var index = 0
	
	for level in LEVELS:
		if level.id == id:
			data = level
			break
			
		index += 1
	
	return {
		"data": data,
		"index": index,
	}










