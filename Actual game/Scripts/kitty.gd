extends Area2D

@export var hide_message: String = "You hid with
the kitty."

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Dwight"):
		body.can_hide = true
		body.current_hide_message = hide_message

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Dwight"):
		body.can_hide = false
