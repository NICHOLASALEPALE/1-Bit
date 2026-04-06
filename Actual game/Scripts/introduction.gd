extends Node2D

@onready var label_1: Label = $label1
@onready var label_2: Label = $label2

@onready var control_1: Sprite2D = $control_1
@onready var control_2: Sprite2D = $control_2
@onready var control_3: Sprite2D = $control_3
@onready var control_4: Label = $control_4
@onready var control_5: Label = $control_5


var intro_step := 0

func _ready() -> void:
	# Start: controls visible
	control_1.visible = true
	control_2.visible = true
	control_3.visible = true
	control_4.visible = true
	control_5.visible = true
	
	# Labels hidden
	label_1.visible = false
	label_2.visible = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_select"):
		
		if intro_step == 0:
			# First Z press → hide controls, show labels
			control_1.visible = false
			control_2.visible = false
			control_3.visible = false
			control_4.visible = false
			control_5.visible = false
			
			label_1.visible = true
			label_2.visible = true
			
			intro_step = 1
			
		elif intro_step == 1:
			# Second Z press → go to next scene
			get_tree().change_scene_to_file("res://Actual game/Scenes/entrance.tscn")
