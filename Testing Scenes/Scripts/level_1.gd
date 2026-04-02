extends Node2D

@export var room_tag: String = "room_1"

func _ready() -> void:
	GameManager.player_current_room = "Level_1"
