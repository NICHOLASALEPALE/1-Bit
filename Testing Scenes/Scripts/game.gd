extends Node2D

@export var room_tag: String = "Game"

func _ready() -> void:
	GameManager.player_current_room = "Game"
	
