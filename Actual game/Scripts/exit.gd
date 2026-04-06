extends Area2D

var player_in_range: Dwight = null
@onready var room = get_parent()

#var bg_freed = preload("res://path_to/birdroom3i_bg2.png")

func _on_body_entered(body: Node2D) -> void:
	if body is Dwight:
		player_in_range = body
		GameManager.key_taken = true

func _on_body_exited(body: Node2D) -> void:
	if body is Dwight:
		player_in_range = null

func _process(delta: float) -> void:
	if player_in_range != null and Input.is_action_just_pressed("ui_select"):
		if GameManager.key_taken == true:
			music_manager.stop_music()
			get_tree().change_scene_to_file("res://Actual game/Scenes/ending.tscn")
		
		if not GameManager.key_taken:
			player_in_range.show_interact_text("I can't jump from here alone.")
			await get_tree().create_timer(3).timeout
			player_in_range.show_interact_text(" ")
		else:
			pass
			#background.texture = bg_freed
