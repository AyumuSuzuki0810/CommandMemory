extends Control
@onready var p1_blind = $"1P_Blind"
@onready var p1_turn_label = $"2P_Blind/TurnLabel"

@onready var p2_blind = $"2P_Blind"
@onready var p2_turn_label = $"1P_Blind/TurnLabel"

# Called when the node enters the scene tree for the first time.
func _ready():
	p2_turn_label.text = GameManager.vs_string + "\nのターン"
	pass # Replace with function body.
	
var b_turn : bool = true
func _process(_delta):
	if GameManager.is_control:
		var n_turn = GameManager.turn
	
		p1_blind.visible = not n_turn
		p2_blind.visible = n_turn
		
		b_turn = n_turn
