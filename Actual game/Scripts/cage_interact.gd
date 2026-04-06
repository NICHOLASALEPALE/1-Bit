extends Area2D

var player_in_range: Dwight = null
@onready var room = get_parent()
@onready var background: Sprite2D = $"../Background"

#var bg_freed = preload("res://path_to/birdroom3i_bg2.png")

func _on_body_entered(body: Node2D) -> void:
	if body is Dwight:
		player_in_range = body

func _on_body_exited(body: Node2D) -> void:
	if body is Dwight:
		player_in_range = null

func _process(delta: float) -> void:
	if player_in_range != null and Input.is_action_just_pressed("ui_select"):
		if not GameManager.has_key:
			player_in_range.show_interact_text("It's locked.")
		else:
			player_in_range.show_interact_text("Be free.")
			GameManager.bird_freed = true
			#background.texture = bg_freed
