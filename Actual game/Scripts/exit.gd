extends Area2D

var player_in_range: Dwight = null
@onready var room = get_parent()
var showing_message := false

func _on_body_entered(body: Node2D) -> void:
	if body is Dwight:
		player_in_range = body

func _on_body_exited(body: Node2D) -> void:
	if body is Dwight and body == player_in_range:
		player_in_range = null

func _process(_delta: float) -> void:
	if showing_message:
		return

	if player_in_range != null and Input.is_action_just_pressed("ui_select"):
		if GameManager.key_taken:
			music_manager.stop_music()
			get_tree().change_scene_to_file("res://Actual game/Scenes/ending.tscn")

		else:
			showing_message = true

			var player := player_in_range

			if player != null and is_instance_valid(player):
				player.show_interact_text("I can't jump from here alone.")

			await get_tree().create_timer(3.0).timeout

			if player != null and is_instance_valid(player):
				player.show_interact_text("")

			showing_message = false
