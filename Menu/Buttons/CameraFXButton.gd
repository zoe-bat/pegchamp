extends CheckBox

func _ready():
	pressed = GameStats.camera_fx

func _on_CameraFXButton_toggled(button_pressed):
	GameStats.camera_fx = button_pressed
	Saves.save_game()
