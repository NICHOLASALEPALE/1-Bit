extends Node

func Go_To_door(Scene_Path:String,Door_Name:String) -> void:
	get_tree().change_scene_to_file(Scene_Path)
	
	pass
