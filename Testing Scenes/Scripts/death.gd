extends Area2D

@onready var game_manager: Node2D = %"Game Manager"

func _ready() -> void:
	pass
	

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Dwight"):
		print("Player touched death area.")
		GameManager.death = true
		get_tree().change_scene_to_file("res://Testing Scenes/Scenes/lose_screen.tscn")
		music_manager.stop_music()
		
