extends HSlider

export var bus_channel = "Master"

func _ready():
	value = db2linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index(bus_channel)))

func _on_MusicVolumeSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(bus_channel),  linear2db(value))

func save_volume():
	Saves.save_game()
