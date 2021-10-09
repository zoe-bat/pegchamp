extends RigidBody2D

var can_be_deleted = false setget set_can_be_deleted, get_can_be_deleted

func _ready() -> void:
	var x_impulse = rand_range(-150, 150)
	var y_impulse = rand_range(-150, 150)
	var impulse_vector = Vector2(x_impulse, y_impulse)
	apply_central_impulse(Vector2(impulse_vector))

func _physics_process(_delta):
	var collider_array = get_colliding_bodies()
	for collider in collider_array:
		set_particle_direction_for(collider)
		turn_pegs_green(collider)

func turn_pegs_green(collider):
	# check if pegs can be turned green
	if (collider.has_method("make_green")):
		#if yes then do it
		collider.make_green()
		if can_be_deleted:
			explode()

func set_particle_direction_for(collider):
	if (collider.has_method("set_particle_direction")):
		collider.set_particle_direction(linear_velocity.normalized() * -1)

func set_can_be_deleted(value):
	can_be_deleted = value

func get_can_be_deleted():
	return can_be_deleted

func spawn_particles():
		var NewParticles = preload("res://Pegs/Yellow/Powerups/Scattershot/ScattershotBallParticles.tscn")
		var particles = NewParticles.instance()
		var main = get_tree().current_scene
		particles.global_position = global_position
		main.add_child(particles)

func explode():
	spawn_particles()
	queue_free()
