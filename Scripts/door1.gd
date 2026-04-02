extends Area2D

@export_file("*.tscn") var level_1:String

@onready var game_manager: Node2D = %"Game Manager"

var May_Is_In:bool


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("May"):
		May_Is_In = true
		print("true")


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("May"):
		May_Is_In = false

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept") and May_Is_In == true:
		GameManager.add_turn()
		get_tree().change_scene_to_file(level_1)
