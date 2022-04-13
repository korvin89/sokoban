extends Node


const LETTER = {
	"1": preload("res://assets/Small Text/27.png"),
	"2": preload("res://assets/Small Text/28.png"),
	"3": preload("res://assets/Small Text/29.png"),
	"4": preload("res://assets/Small Text/30.png"),
	"5": preload("res://assets/Small Text/31.png"),
	"6": preload("res://assets/Small Text/32.png"),
	"7": preload("res://assets/Small Text/33.png"),
	"8": preload("res://assets/Small Text/34.png"),
	"9": preload("res://assets/Small Text/35.png"),
	"0": preload("res://assets/Small Text/36.png"),
}


func letter_to_texture(letter: String) -> Texture:
	return LETTER[letter]
