extends Node2D

@export var room_tag: String = "egg_1c"
@export var monster_spawn_position: Vector2 = Vector2(25, 300)
@export var monster_despawn_time: float = 6.0

var monster_scene = preload("res://Testing Scenes/Scenes/monster.tscn")
var monster: Node = null

func _ready() -> void:
	print("Room script running in:", name)
	print("GameManager exists:", GameManager)
	print("Enemy bool seen by room:", GameManager.enemy_is_in_player_room())

	GameManager.player_current_room = room_tag

	await get_tree().create_timer(1.0).timeout
	print("player in " + GameManager.player_current_room)

	if GameManager.enemy_is_in_player_room():
		print("enemy spawned")
		monster = monster_scene.instantiate()
		monster.global_position = monster_spawn_position
		add_child(monster)
		monster.start_walking()

		await get_tree().create_timer(monster_despawn_time).timeout

		if is_instance_valid(monster):
			monster.queue_free()
			monster = null
			print("enemy despawned")
