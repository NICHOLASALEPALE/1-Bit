extends Node

var destination_door: String = ""

func go_to_door(scene_path: String, door_name: String) -> void:
	destination_door = door_name
	get_tree().change_scene_to_file(scene_path)

	await get_tree().process_frame
	await get_tree().process_frame

	var all_doors: Array[Node] = get_tree().get_nodes_in_group("Door")
	var player: Node2D = get_tree().get_first_node_in_group("Dwight")

	print("Looking for destination door tag: ", door_name)
	print("Doors found: ", all_doors)
	print("Player found: ", player)

	if player == null:
		print("ERROR: Player not found after scene change")
		return

	for door in all_doors:
		print("Checking door node: ", door.name)

		if "door_tag" in door:
			print("Door tag is: ", door.door_tag)

			if door.door_tag == door_name:
				player.global_position = door.global_position
				print("Moved player to: ", door.door_tag, " at ", door.global_position)
				return

	print("ERROR: No matching door tag found")
