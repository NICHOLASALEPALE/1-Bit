extends Area2D

var May_is_attacked:bool


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("May"):
		May_is_attacked = true
		
	if May_is_attacked == true:
		print("yep")
		get_tree().change_scene_to_file("res://Scenes/lose_screen.tscn")


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("May"):
		May_is_attacked == false
		
		
