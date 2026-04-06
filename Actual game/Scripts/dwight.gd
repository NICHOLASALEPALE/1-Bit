extends CharacterBody2D

class_name Dwight

@onready var game_manager: Node2D = %"Game Manager"

const SPEED = 150.0
const JUMP_VELOCITY = -400.0

var is_hiding: bool = false
var can_hide: bool = false
var hide_position: Vector2
var current_hide_message: String = ""
var bread_key_message: String = ""
var chosen: bool = false

@onready var amimated_sprite_2d: AnimatedSprite2D = $AmimatedSprite2D
var facing_right: bool = true

@onready var collision: CollisionShape2D = $CollisionShape2D
@onready var hide_text_label: Label = $"../HideTextLabel"
@onready var hide_text_timer: Timer = $"../HideTextTimer"
@onready var interact_text_label: Label = $"../HideTextLabel"
@onready var interact_text_timer: Timer = $"../HideTextTimer"

@onready var item_text = $CanvasLayer/ItemText

var message_queue: Array[String] = []
var showing_message: bool = false



func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_select") and can_hide:
		await get_tree().create_timer(0.3).timeout
		toggle_hide()
		

	if Input.is_action_just_pressed("ui_select") and  is_hiding:
		await get_tree().create_timer(0.3).timeout
		toggle_hide()
		GameManager.add_turn()

	if is_hiding:
		velocity = Vector2.ZERO
		move_and_slide()
		return

	if not is_on_floor():
		velocity += get_gravity() * delta

	var direction := Input.get_axis("ui_left", "ui_right")

	if direction > 0:
		velocity.x = direction * SPEED
		facing_right = true
		amimated_sprite_2d.play("walk_right")
	elif direction < 0:
		velocity.x = direction * SPEED
		facing_right = false
		amimated_sprite_2d.play("walk_left")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

		if facing_right:
			amimated_sprite_2d.play("idle_right")
		else:
			amimated_sprite_2d.play("idle_left")

	move_and_slide()

func toggle_hide() -> void:
	is_hiding = !is_hiding

	if is_hiding:
		hide_position = global_position
		amimated_sprite_2d.visible = false
		collision.disabled = true
		show_hide_text(current_hide_message)

	else:
		global_position = hide_position
		amimated_sprite_2d.visible = true
		collision.disabled = false

func has_chosen() -> void:
	if chosen == true:
		show_hide_text(current_hide_message)

func show_hide_text(message: String) -> void:
	if hide_text_label == null:
		return

	hide_text_label.text = ""
	hide_text_label.visible = true

	for i in message.length():
		hide_text_label.text += message[i]
		await get_tree().create_timer(0.03).timeout

	if hide_text_timer:
		hide_text_timer.start()

func show_interact_text(message: String) -> void:
	if interact_text_label == null:
		return

	interact_text_label.text = ""
	interact_text_label.visible = true

	for i in message.length():
		interact_text_label.text += message[i]
		await get_tree().create_timer(0.03).timeout

	interact_text_timer.start()


func _on_hide_text_timer_timeout() -> void:
	hide_text_label.visible = false
	interact_text_label.visible = false


func _on_timer_timeout() -> void:
	pass # Replace with function body.
	
func show_item_text(message: String, duration: float = 2.0) -> void:
	message_queue.append(message)
	if not showing_message:
		process_queue(duration)

func process_queue(duration: float) -> void:
	showing_message = true

	while message_queue.size() > 0:
		item_text.text = message_queue.pop_front()
		item_text.visible = true
		
		await get_tree().create_timer(duration).timeout
		
		item_text.visible = false
		await get_tree().create_timer(0.2).timeout

	showing_message = false
