extends CharacterBody2D

class_name Dwight

@onready var game_manager: Node2D = %"Game Manager"

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var is_hiding: bool = false
var can_hide: bool = false
var hide_position: Vector2

@onready var sprite: Sprite2D = $Sprite2D
@onready var collision: CollisionShape2D = $CollisionShape2D


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_select") and can_hide:
		await get_tree().create_timer(0.3).timeout
		toggle_hide()
		
	if Input.is_action_just_pressed("ui_select") and  is_hiding:
		await get_tree().create_timer(0.3).timeout
		toggle_hide()

	if is_hiding:
		velocity = Vector2.ZERO
		move_and_slide()
		return

	if not is_on_floor():
		velocity += get_gravity() * delta

	# Uncomment if you want jumping
	# if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	# 	velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func toggle_hide() -> void:
	is_hiding = !is_hiding

	if is_hiding:
		hide_position = global_position
		sprite.visible = false
		collision.disabled = true
	else:
		global_position = hide_position
		sprite.visible = true
		collision.disabled = false
