extends Area2D

#@export_file("*.tscn") var level_1:String

#@onready var game_manager: Node2D = %"Game Manager"

var Dwight_Is_In:bool

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Dwight"):
		Dwight_Is_In = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Dwight"):
		Dwight_Is_In = false


		
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept") and Dwight_Is_In and GameManager.death == false:
		GameManager.add_turn()

		if GameManager.death == false:
			get_tree().change_scene_to_file("res://Actual game/Scenes/dining_room.tscn")
