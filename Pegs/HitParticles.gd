extends Particles2D
var emitting_direction = Vector2();

func _ready():
	emitting = true
	#set particle direction
	var x = emitting_direction.x
	var y = emitting_direction.y
	process_material.set_direction(Vector3(x,y,0))
