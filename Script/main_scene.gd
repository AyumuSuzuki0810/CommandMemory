extends Node

@onready var turn_ui = $TurnUI

func _ready():
	GameManager.push_num = 0
	GameManager.command_memory.clear()
	GameManager.is_game_set = false
	GameManager.turn = true
	
	if GameManager.is_tempo_timer:
		TempoTimer.start()

var once = true
func _process(_delta):
	if  once and GameManager.is_game_set:
		$TurnUI.visible = false
		$Result.visible = true
		var win_text : String
		if GameManager.turn:
			win_text = GameManager.vs_string
		else:
			win_text = "Player1"
		$Result/Label.text = win_text + "\nWin!!"
		$BackTimer.start()
		once = false


func _on_back_timer_timeout():
	SceneManager.change_scene("Title")
	pass # Replace with function body.
