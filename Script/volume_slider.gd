extends "res://Script/audio.gd"

@export var bus_type : AUDIO_BUS
var bus_index : int

func _ready():
				
	var bus_name : String = get_bus_name(bus_type)
	bus_index = AudioServer.get_bus_index(bus_name)
	
	value = get_db_liner(bus_type)
	pass
	
func _on_value_changed(volume : float):
	set_bus_volume(volume)
	pass # Replace with function body.

func set_bus_volume(val : float):
	AudioServer.set_bus_volume_db(
		bus_index,
		linear_to_db(val)
	)
