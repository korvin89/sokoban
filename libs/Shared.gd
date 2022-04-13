extends Node


const SCREEN_WIDTH = 208
const SCREEN_HEIGHT = 368
const TILE_SIZE = 16

const DATA_KEY = {
	"VERSION": "version",
	"MODE": "mode",
	"HELP_SHOWN": "help_shown",
	"UNLOCKED_LEVELS": "unlocked_levels",
}

const META = {
	"TILEMAP": "tilemap",
	"MOVABLE": "movable",
	"POINT": "point",
}

const TILE = {
	"CARTON_POINT": 73,
	"CARTON_BOX": 74,
	"BATTERY_BOX": 75,
	"BATTERY_POINT": 76,
}

const MODE = {
	"EASY": "easy",
	"MEDIUM": "medium",
	"HARD": "hard",
}

const SIGNAL = {
	"START_GAME": "start_game",
	"COMPLETE_LEVEL": "complete_level",
	"RESTART_LEVEL": "restart_level",
	"OPEN_MENU": "open_menu",
	"OPEN_HELP": "open_help",
	"MOVE_BOX": "move_box",
}

enum Dir {Left, Right, Up, Down}
enum BoxType {Carton, Battery}








