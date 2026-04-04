extends Node

var destination_door: String = ""

func go_to_door(scene_path: String, door_dest: String) -> void:
	destination_door = door_dest
	get_tree().change_scene_to_file(scene_path)
