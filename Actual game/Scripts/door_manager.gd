extends Node

var door_sound_player: AudioStreamPlayer

func _ready() -> void:
	door_sound_player = AudioStreamPlayer.new()
	door_sound_player.stream = preload("res://Actual game/Music/DoorSFX.mp3")
	add_child(door_sound_player)
	door_sound_player.volume_db = -10

func Go_To_Door(Scene_Path:String, Door_Name:String) -> void:
	get_tree().change_scene_to_file(Scene_Path)
	await get_tree().create_timer(0.1).timeout
	var All_Doors: Array[Node] = get_tree().get_nodes_in_group("Door")
	var Player:CharacterBody2D = get_tree().get_first_node_in_group("Dwight")
	print(All_Doors)
	
	if door_sound_player:
		door_sound_player.play()
	
	for X in len(All_Doors):
		if All_Doors[X].name == Door_Name:
			Player.global_position = All_Doors[X].global_position
		else:
			print("not found")
	
	pass
