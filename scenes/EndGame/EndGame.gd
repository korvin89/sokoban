extends Node2D


func _on_TextureButton_pressed():
	EventBus.emit_signal(Shared.SIGNAL.OPEN_MENU)
