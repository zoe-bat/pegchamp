extends StaticBody2D

var can_be_destroyed = false
var particle_emitting_direction = Vector2.ZERO

func _ready():
	$AnimationPlayer.play("spawn")

func make_green():
	explode()

func explode():
	if can_be_destroyed:
		$ScoreCounter.trigger()
		spawn_hit_particles(particle_emitting_direction)
		queue_free()

func _on_GraceTimer_timeout():
	can_be_destroyed = true

func set_particle_direction(vector):
	particle_emitting_direction = vector

# spawns particles
func spawn_hit_particles(vector):
	set_particle_direction(vector)
	var Hit_effect = load("res://Pegs/Green/BarHitParticles.tscn")
	var hit_effect = Hit_effect.instance()
	var main = get_tree().current_scene
	
	hit_effect.position = position
	hit_effect.emitting_direction = particle_emitting_direction
	
	main.add_child(hit_effect)
