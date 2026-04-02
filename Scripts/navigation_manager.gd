extends Node

const scene_game = preload ("res://Scenes/Game.tscn")
const scene_level_1 = preload ("res://Scenes/level_1.tscn")

var spawn_door_tag

func go_to_level(level_tag, destination_tag):
	var scene_to_load
	
	match level_tag:
		"game":
			scene_to_load = scene_game
		"level_1":
			scene_to_load = scene_level_1
			
			if scene_to_load != null:
				spawn_door_tag = destination_tag
				get_tree().change_scene_to_packed(scene_to_load)
