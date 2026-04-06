extends Node2D

@export var room_tag: String = "birdroom_3i"
@export var monster_spawn_position: Vector2 = Vector2(25, 300)
@export var monster_despawn_time: float = 10.0
@onready var background: Sprite2D = $Background

var monster_scene = preload("res://Testing Scenes/Scenes/monster.tscn")
var monster: Node = null

#var bg_locked = preload("res://path_to/birdroom3i_bg.png")
#var bg_freed = preload("res://path_to/birdroom3i_bg2.png")

func _ready() -> void:
	print("Room script running in:", name)
	print("GameManager exists:", GameManager)
	print("Enemy bool seen by room:", GameManager.enemy_is_in_player_room())

	GameManager.player_current_room = room_tag
	music_manager.update_music_for_current_scene()

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
			
	if GameManager.bird_freed:
		#background.texture = bg_freed
		pass
	else:
		#background.texture = bg_locked
		pass
