extends HSlider
var changes_to_save = false

export var bus_channel = "Master"

func _ready():
	value = db2linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index(bus_channel)))

func _on_MusicVolumeSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(bus_channel),  linear2db(value))
	changes_to_save = true

func save_volume():
	if changes_to_save:
		Saves.save_game()
		changes_to_save = false;
