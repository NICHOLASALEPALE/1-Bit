extends CharacterBody2D

@export var speed: float = 400.0
@export var walk_speed: float = 150.0  # slower forward movement

var player: Node2D = null
var chasing: bool = false
var is_active: bool = false

var Dwight_Is_Seen: bool
var heartbeat_sound_player: AudioStreamPlayer


func _ready() -> void:
	heartbeat_sound_player = AudioStreamPlayer.new()
	heartbeat_sound_player.stream = preload("res://Actual game/Music/HeartbeatSFX.mp3")
	add_child(heartbeat_sound_player)
	# Check your global condition here
	heartbeat_sound_player.volume_db = 10  # start quiet
	
	
	if GameManager.enemy_is_in_player_room():
		is_active = true
		print("spawned")
		start_walking()

func start_walking() -> void:
	chasing = false  # not chasing yet
	if heartbeat_sound_player:
		heartbeat_sound_player.play()

func _physics_process(delta: float) -> void:
	if not is_active:
		return

	if chasing and player != null:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * speed

		#var distance = global_position.distance_to(player.global_position)
		#distance = clamp(distance, 50.0, 500.0)

		#var t = (distance - 50.0) / (500.0 - 50.0)
		#heartbeat_sound_player.volume_db = lerp(0.0, -30.0, t)
	else:
		velocity = Vector2.RIGHT * walk_speed

	move_and_slide()
