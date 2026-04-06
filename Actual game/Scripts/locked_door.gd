extends Area2D

var player_in_range: Dwight = null
@onready var room = get_parent()
var showing_message := false

#var bg_freed = preload("res://path_to/birdroom3i_bg2.png")

func _on_body_entered(body: Node2D) -> void:
	if body is Dwight:
		player_in_range = body

func _on_body_exited(body: Node2D) -> void:
	if body is Dwight:
		player_in_range = null

func _process(delta: float) -> void:
	if showing_message:
		return
		
	if player_in_range != null and Input.is_action_just_pressed("ui_select"):
		if not GameManager.has_key:
			showing_message = true
			
			var player := player_in_range
			
			if player != null and is_instance_valid(player):
				player.show_interact_text("It's locked.")
			
			await get_tree().create_timer(1.0).timeout
			
			if player != null and is_instance_valid(player):
				player.show_interact_text("")
			
			showing_message = false
