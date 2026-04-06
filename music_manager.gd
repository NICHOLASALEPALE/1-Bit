extends Node

var audio_player: AudioStreamPlayer

var mansion1_scenes := [
	"room_2a",
	"room_2",
	"entrance",
	"hall_3",
	"nest_3a",
	"livingroom_3b",
	"bedrom_3f",
	"library_3c",
	"study_1"
]

var mansion2_scenes := [
	"outlet_1a",
	"hall_1b",
	"egg_1c",
	"bedroom_1g",
	"bedroom_1h",
	"bedroom_1i",
	"secretbath_1j",
	"exit_1k"
]

var birdroom_scenes := [
	"birdroom_3i"
]

var mansion1_music: AudioStream = preload("res://Actual game/Music/Mansion1.mp3")
var mansion2_music: AudioStream = preload("res://Actual game/Music/Mansion2.mp3")
var birdroom_music: AudioStream = preload("res://Actual game/Music/BirdroomOST.mp3")

var current_track_name: String = ""

func _ready() -> void:
	audio_player = AudioStreamPlayer.new()
	add_child(audio_player)
	audio_player.bus = "Master"

func update_music_for_current_scene() -> void:
	var current_scene = get_tree().current_scene
	if current_scene == null:
		print("No current scene found.")
		return

	var scene_name: String = str(current_scene.name).to_lower().strip_edges()
	print("Current scene name: ", scene_name)

	if scene_name in mansion1_scenes:
		if current_track_name != "mansion1":
			play_mansion1()
	elif scene_name in mansion2_scenes:
		if current_track_name != "mansion2":
			play_mansion2()
	elif scene_name in birdroom_scenes:
		if current_track_name != "birdroomost":
			play_birdroom()
	else:
		print("No music assigned for scene: ", scene_name)

func play_mansion1() -> void:
	if current_track_name == "mansion1":
		return
	audio_player.stream = mansion1_music
	audio_player.play()
	current_track_name = "mansion1"
	print("Now playing Mansion 1")

func play_mansion2() -> void:
	if current_track_name == "mansion2":
		return
	audio_player.stream = mansion2_music
	audio_player.play()
	current_track_name = "mansion2"
	print("Now playing Mansion 2")
	
func play_birdroom() -> void:
	if current_track_name == "birdroomost":
		return
	audio_player.stream = birdroom_music
	audio_player.play()
	current_track_name = "birdroomost"
	print("Now playing Bird Room")
	
func stop_music() -> void:
	if audio_player != null:
		audio_player.stop()
	current_track_name = ""
