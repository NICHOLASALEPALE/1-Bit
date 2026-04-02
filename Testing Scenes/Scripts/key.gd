extends Area2D

@onready var game_manager: Node2D = %"Game Manager"

var May_Is_In:bool

func _on_body_entered(_body: Node2D) -> void:
	game_manager.add_point()
	May_Is_In = true
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept") and May_Is_In == true:
		print("Player got key")
		GameManager.add_turn()
		queue_free()
