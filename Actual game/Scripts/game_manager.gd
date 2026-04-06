extends Node2D

var score: int = 0
var turns: int = 0
var enemy_progress: int = 0

@onready var score_label: Label = $"score label"
#@onready var item_text: Label = $ItemText


var player_current_room: String = "entrance"
var enemy_current_room: String = "room_2a"
var death:bool = false

var has_key: bool = false
var bird_freed: bool = false
var key_taken: bool = false
var bread_taken: bool = false
var chosen: bool = false

var room_order: Array[String] = [
	"room_2a",
	"room_2",
	"entrance",
	"hall_3",
	"nest_3a",
	"livingroom_3b",
	"bedrom_3f",
	"library_3c",
	"birdroom_3i",
	"study_1",
	"outlet_1a",
	"hall_1b",
	"egg_1c",
	"bedroom_1g",
	"bedroom_1h",
	"bedroom_1i",
	"secretbath_1j",
	"exit_1k"
	
	
]

var room_costs := {
	"room_2a":1,
	"room_2": 1,
	"entrance": 1,
	"hall_3": 1,
	"nest_3a": 1,
	"livingroom_3b": 1,
	"bedrom_3f": 1,
	"library_3c": 1,
	"birdroom_3i": 1,
	"study_1": 1,
	"outlet_1a": 1,
	"hall_1b": 1,
	"egg_1c": 1,
	"bedroom_1g": 1,
	"bedroom_1h": 1,
	"bedroom_1i": 1,
	"secretbath_1j": 1,
	"exit_1k": 1
	
	
	
}

var message_queue: Array[String] = []
var showing_message: bool = false

func _ready() -> void:
	update_score_label()
	#if item_text:
		#item_text.visible = false

func update_score_label() -> void:
	pass

func add_point() -> void:
	score += 1
	update_score_label()

func add_turn(amount: int = 1) -> void:
	turns += amount
	enemy_progress += amount

	#print("----- NEW TURN -----")
	#print("Turns: ", turns)
	print("Player Room: ", player_current_room)
	#print("Enemy Room BEFORE move: ", enemy_current_room)
	#print("Enemy Progress BEFORE move: ", enemy_progress)

	update_enemy_position()

	print("Enemy Room AFTER move: ", enemy_current_room)
	#print("Enemy Progress AFTER move: ", enemy_progress)

	if enemy_is_in_player_room():
		print("Enemy has arrived in the player's room!")
		
		#death = true
		#get_tree().change_scene_to_file("res://Testing Scenes/Scenes/lose_screen.tscn")

	#print("--------------------")

func update_enemy_position() -> void:
	var enemy_index = room_order.find(enemy_current_room)

	if enemy_index == -1:
		print("ERROR: enemy_current_room not found in room_order: ", enemy_current_room)
		return

	while true:
		var next_index = enemy_index + 1

		if next_index >= room_order.size():
			next_index = 0

		var next_room = room_order[next_index]
		var cost = room_costs.get(next_room, 1)

		#print("Trying to move enemy to: ", next_room, " | Cost: ", cost)

		if enemy_progress >= cost:
			enemy_progress -= cost
			enemy_current_room = next_room
			enemy_index = next_index
			#print("Enemy moved to: ", enemy_current_room)
		else:
			#print("Not enough progress to move.")
			break


func enemy_is_in_player_room() -> bool:
	print("GameManager check returning: ", enemy_is_in_player_room)
	return enemy_current_room == player_current_room
	
#func show_item_text(message: String, duration: float = 2.0) -> void:
	#message_queue.append(message)

	#if not showing_message:
		#process_message_queue(duration)

#func process_message_queue(duration: float) -> void:
	#showing_message = true

#	while message_queue.size() > 0:
		#var next_message = message_queue.pop_front()
		#item_text.text = next_message
		#item_text.visible = true

		#await get_tree().create_timer(duration).timeout

		#item_text.visible = false
		#await get_tree().create_timer(0.2).timeout

	#showing_message = false
