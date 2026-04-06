extends Area2D

@onready var enemy = get_parent()
var mantis_sound_player: AudioStreamPlayer

func _ready() -> void:
	mantis_sound_player = AudioStreamPlayer.new()
	mantis_sound_player.stream = preload("res://Actual game/Music/PrayingMantisHearsYouSFX.mp3")
	add_child(mantis_sound_player)
	# Check your global condition here
	mantis_sound_player.volume_db = 5  # start quiet

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Dwight"):
		#enemy.May_Is_Seen = true
		enemy.player = body
		enemy.chasing = true
		if mantis_sound_player:
			mantis_sound_player.play()

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Dwight"):
		#enemy.Dwight_Is_Seen = false
		enemy.player = null
		enemy.chasing = false
