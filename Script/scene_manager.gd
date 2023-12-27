extends Node

@export var scene_dictionary : Dictionary = {
	"Title" : preload("res://tscn/Scene/title_scene.tscn"),
	"Main": preload("res://tscn/Scene/main_scene.tscn"),
}

func change_scene(target_scene : String)->void:
	get_tree().change_scene_to_packed(scene_dictionary[target_scene])
	
func retry():
	get_tree().reload_current_scene()
