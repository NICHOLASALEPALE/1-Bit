extends Area2D

@onready var game_manager: Node2D = %"Game Manager"
var mantis_sound_player: AudioStreamPlayer

func _ready() -> void:
	mantis_sound_player = AudioStreamPlayer.new()
	mantis_sound_player.stream = preload("res://Actual game/Music/PrayingMantisHearsYouSFX.mp3")
	add_child(mantis_sound_player)
	# Check your global condition here
	mantis_sound_player.volume_db = 10  # start quiet
	

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Dwight"):
		print("Player touched death area.")
		if mantis_sound_player:
			mantis_sound_player.play()
		GameManager.death = true
		get_tree().change_scene_to_file("res://Testing Scenes/Scenes/lose_screen.tscn")
		
