extends RigidBody2D

export var shotspeed = 200

func _on_Kill_Timer_timeout():
	queue_free()
		
func _ready():
	var direction = get_local_mouse_position().normalized()
	var speed = position.distance_to(get_global_mouse_position())
	speed *= shotspeed / 100
	speed = clamp(speed, 0, 200)
	apply_central_impulse(speed * direction)
	

func _physics_process(_delta):
	if (get_colliding_bodies()):
		queue_free()


func _process(_delta):
	if (Input.is_action_just_released("shoot")):
		queue_free()

func bounce_of(collider):
	if (collider.has_method("bouncy")):
		apply_central_impulse(linear_velocity.normalized() * shotspeed / 5)
