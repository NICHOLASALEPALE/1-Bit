extends CharacterBody2D

@export var speed: float = 300.0
@export var walk_speed: float = 150.0  # slower forward movement

var player: Node2D = null
var chasing: bool = false
var is_active: bool = false

var Dwight_Is_Seen: bool

func _ready() -> void:
	# Check your global condition here
	if GameManager.enemy_is_in_player_room():
		is_active = true
		print("spawned")
		start_walking()

func start_walking() -> void:
	chasing = false  # not chasing yet

func _physics_process(delta: float) -> void:
	if not is_active:
		return

	# 🔴 CHASING LOGIC (same as yours)
	if chasing and player != null:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * speed
	
	# 🟢 DEFAULT WALK FORWARD
	else:
		velocity = Vector2.RIGHT * walk_speed  # change direction if needed

	move_and_slide()
