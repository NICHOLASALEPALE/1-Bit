extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Dwight"):
		body.can_hide = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Dwight"):
		body.can_hide = false
