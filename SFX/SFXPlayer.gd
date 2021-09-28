extends AudioStreamPlayer

var sounds = []

func _ready():
	sounds.append("res://SFX/boop/C.wav")
	sounds.append("res://SFX/boop/C#.wav")
	sounds.append("res://SFX/boop/D.wav")
	sounds.append("res://SFX/boop/D#.wav")
	sounds.append("res://SFX/boop/E.wav")
	sounds.append("res://SFX/boop/F.wav")
	sounds.append("res://SFX/boop/F#.wav")
	sounds.append("res://SFX/boop/G.wav")
	sounds.append("res://SFX/boop/G#.wav")
	sounds.append("res://SFX/boop/A.wav")
	sounds.append("res://SFX/boop/A#.wav")
	sounds.append("res://SFX/boop/B.wav")

	var sfx
	# play the highest note when the multiplayer is larger than the amount of available sounds
	if(sounds.size() <= GameStats.multiplier):
		sfx = load(sounds[sounds.size() - 1])
	else: sfx = load(sounds[GameStats.multiplier - 1])
	stream = sfx
	
	play()
