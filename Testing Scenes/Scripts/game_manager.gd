extends Node2D

var score: int = 0
var turns: int = 0
var enemy_progress: int = 0

@onready var score_label: Label = $"score label"

var player_current_room: String = "Game"
var enemy_current_room: String = "Game"
var death:bool = false

var room_order: Array[String] = [
	"Game",
	"level_1",
	"level_2"
]

var room_costs := {
	"Game": 1,
	"level_1": 1,
	"level_2": 1
}

func _ready() -> void:
	update_score_label()

func update_score_label() -> void:
	pass

func add_point() -> void:
	score += 1
	update_score_label()

func add_turn(amount: int = 1) -> void:
	turns += amount
	enemy_progress += amount

	print("----- NEW TURN -----")
	print("Turns: ", turns)
	print("Player Room: ", player_current_room)
	print("Enemy Room BEFORE move: ", enemy_current_room)
	print("Enemy Progress BEFORE move: ", enemy_progress)

	update_enemy_position()

	print("Enemy Room AFTER move: ", enemy_current_room)
	print("Enemy Progress AFTER move: ", enemy_progress)

	if enemy_is_in_player_room():
		print("Enemy has arrived in the player's room!")
		death = true
		get_tree().change_scene_to_file("res://Testing Scenes/Scenes/lose_screen.tscn")

	print("--------------------")

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

		print("Trying to move enemy to: ", next_room, " | Cost: ", cost)

		if enemy_progress >= cost:
			enemy_progress -= cost
			enemy_current_room = next_room
			enemy_index = next_index
			print("Enemy moved to: ", enemy_current_room)
		else:
			print("Not enough progress to move.")
			break

func enemy_is_in_player_room() -> bool:
	return enemy_current_room == player_current_room
