extends Node2D

@export var room_tag: String = "room_2a"

func _ready() -> void:
	GameManager.player_current_room = "room_2"
