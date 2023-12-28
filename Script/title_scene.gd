extends Node

@onready var title = $Control/Title

@onready var menu = $Control/Menu
@onready var option_menu = $Control/OptionMenu

func _ready():
	TempoTimer.stop()
	$Control/Menu/Option.grab_focus()

func _on_one_player_pressed():
	GameManager.vs_npc()
	SceneManager.change_scene("Main")
	pass # Replace with function body.


func _on_two_player_pressed():
	GameManager.vs_p2()
	SceneManager.change_scene("Main")
	pass # Replace with function body.


func _on_quit_button_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_option_pressed():
	title.visible = false
	menu.visible = false
	option_menu.visible = true
	option_menu.first_foucs.grab_focus()
	pass # Replace with function body.
