extends  HSlider

enum AUDIO_BUS{
	Master,
	BGM,
	SE
}

var audio_bus : Dictionary = {
	AUDIO_BUS.Master : "Master",
	AUDIO_BUS.BGM : "BGM",
	AUDIO_BUS.SE : "SE"
}

func get_bus_name(bus : AUDIO_BUS)->String:
	return audio_bus[bus]
	
func get_db_liner(bus : AUDIO_BUS):
	var db = AudioServer.get_bus_volume_db(bus)
	return db_to_linear(db)
