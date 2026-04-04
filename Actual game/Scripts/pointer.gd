extends CharacterBody2D

@onready var pointer: CharacterBody2D = $"."
@onready var start: Marker2D = $"../../start"
@onready var end: Marker2D = $"../../end"
@onready var safestartpos: Marker2D = $"../../safestartpos"
@onready var safeendpos: Marker2D = $"../../safeendpos"

var direction = 1
var speed = 200

func _ready():
	pointer.global_position.x = start.global_position.x

func _process(delta: float) -> void:
	if pointer.position.x <= start.position.x:
		direction = 1
	elif pointer.position.x >= end.position.x:
		direction = -1

	pointer.velocity.x = direction * speed
	pointer.move_and_slide()

func is_in_safe_zone() -> bool:
	return pointer.position.x >= safestartpos.position.x and \
		   pointer.position.x <= safeendpos.position.x
