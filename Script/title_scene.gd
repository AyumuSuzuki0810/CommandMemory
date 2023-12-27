extends Node


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
