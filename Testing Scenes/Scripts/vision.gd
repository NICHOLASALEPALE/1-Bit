extends Area2D

@onready var enemy = get_parent()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("May"):
		#enemy.May_Is_Seen = true
		enemy.player = body
		enemy.chasing = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("May"):
		enemy.May_Is_Seen = false
		enemy.player = null
		enemy.chasing = false
