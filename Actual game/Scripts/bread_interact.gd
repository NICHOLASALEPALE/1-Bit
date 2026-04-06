extends Area2D

var player_in_range: Dwight = null
#@export var bread_message: String = "Because bread tastes better than key."
@export var hide_message: String = "Because bread tastes better than key."

func _ready() -> void:
	if GameManager.bread_taken:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Dwight:
		player_in_range = body

func _on_body_exited(body: Node2D) -> void:
	if body is Dwight:
		player_in_range = null

func _process(delta: float) -> void:
	if player_in_range != null and Input.is_action_just_pressed("ui_select"):
		#player_in_range.show_interact_text("Because bread tastes better than key.")
		GameManager.chosen = true
		player_in_range.show_interact_text("Because bread tastes 
		better than key.")
		#GameManager.show_item_text("Because bread tastes better than key.")
		
	if GameManager.chosen == true:
		queue_free()
		
#func interact() -> void:
	#GameManager.bread_taken = true
	

	#queue_free()
