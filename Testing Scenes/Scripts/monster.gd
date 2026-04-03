extends CharacterBody2D

@export var speed: float = 400.0

var player: Node2D = null
var chasing: bool = false

var May_Is_Seen:bool

func _physics_process(delta: float) -> void:
	if chasing and player != null:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()
