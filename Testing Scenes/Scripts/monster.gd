extends CharacterBody2D

@export var speed: float = 250.0
@export var walk_speed: float = 175.0
@export var move_direction: int = 1

var player: Node2D = null
var chasing: bool = false
var is_active: bool = false

var heartbeat_sound_player: AudioStreamPlayer

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	heartbeat_sound_player = AudioStreamPlayer.new()
	heartbeat_sound_player.stream = preload("res://Actual game/Music/HeartbeatSFX.mp3")
	heartbeat_sound_player.volume_db = 10
	heartbeat_sound_player.finished.connect(_on_heartbeat_finished)
	add_child(heartbeat_sound_player)
	


func start_walking() -> void:
	is_active = true
	chasing = false
	
	if heartbeat_sound_player:
		heartbeat_sound_player.play()

func start_chasing(target: Node2D) -> void:
	player = target
	chasing = true
	is_active = true

	
	if heartbeat_sound_player and not heartbeat_sound_player.playing:
		heartbeat_sound_player.play()

func _physics_process(delta: float) -> void:
	if not is_active:
		return

	if chasing and player != null:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * speed
	else:
		velocity = Vector2(move_direction * walk_speed, 0)

	move_and_slide()

	if not chasing and is_on_wall():
		flip_direction()

func flip_direction() -> void:
	move_direction *= -1
	
	if sprite:
		sprite.flip_h = move_direction > 0

func _on_heartbeat_finished() -> void:
	if heartbeat_sound_player and is_active:
		heartbeat_sound_player.play()
