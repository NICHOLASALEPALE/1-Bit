extends Node2D

@export var room_tag: String = "room_2"

func _ready() -> void:
	GameManager.player_current_room = "room_2"
