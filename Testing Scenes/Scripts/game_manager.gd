extends Node2D

var score = 0

@onready var score_label: Label = $"score label"

func add_point():
		score += 1
		score_label.text = "とつげき" + str(score)
		
		

var turns: int = 0

func add_turn():
		turns += 1
		print(turns)
