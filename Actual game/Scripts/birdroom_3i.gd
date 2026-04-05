extends Node2D

@export var room_tag: String = "birdroom_3i"
var monster_scene = preload("res://Testing Scenes/Scenes/monster.tscn")

func _ready() -> void:
	print("Room script running in:", name)
	print("GameManager exists:", GameManager)
	print("Enemy bool seen by room:", GameManager.enemy_is_in_player_room())
	GameManager.player_current_room = "birdroom_3i"
	await get_tree().create_timer(1).timeout
	print("player in " + GameManager.player_current_room)
	
	if GameManager.enemy_is_in_player_room():
		print("enemy spawned")
		var monster = monster_scene.instantiate()
		monster.global_position = Vector2(100, 200)
		add_child(monster)
		monster.start_walking()
