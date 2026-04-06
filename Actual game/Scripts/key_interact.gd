extends Area2D

var player_in_range: Dwight = null
@export var hide_message: String = "You got key."

func _ready() -> void:
	if GameManager.key_taken:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Dwight:
		player_in_range = body
		body.current_hide_message = hide_message

func _on_body_exited(body: Node2D) -> void:
	if body is Dwight:
		player_in_range = null

func _process(delta: float) -> void:
	if player_in_range != null and Input.is_action_just_pressed("ui_select"):
		GameManager.has_key = true
		#player_in_range.show_interact_text("You got key.")
		GameManager.chosen = true
		GameManager.show_item_text("You picked up a key.")
	
	if GameManager.chosen == true:
		queue_free()
		
#func interact() -> void:
	#GameManager.has_key = true
	#GameManager.key_taken = true
	#GameManager.show_item_text("You picked up a key.")
