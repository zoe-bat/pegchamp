extends RigidBody2D

export var shotspeed = 100

onready var cameraTransform = $CameraTransform
onready var trajectoryTimer = $TrajectoryTimer
onready var animation = $AnimationPlayer

enum {FALL, AIM, RESPAWN}
var state = RESPAWN

var can_spawn_trajectory_dot = false

func _ready():
	cameraTransform.position = Vector2.ZERO
	animation.play("reset")
	GameStats.balls_left = GameStats.max_balls
	var _connect = GameStats.connect("game_won", self, "queue_free")

func _physics_process(_delta):
	match state:
		FALL: fall()
		AIM: aim()
		RESPAWN: spawn_trajectory_dots()

func fall():
	handle_collisions()

func handle_collisions():
	# get an array with objects the ball is colliding with
	var collider_array = get_colliding_bodies()
	if (collider_array):
		for collider in collider_array:
			set_particle_direction(collider)
			bounce_of(collider)
			call_deferred("turn_pegs_green", collider)

func turn_pegs_green(collider):
	# check if pegs can be turned green
	if (collider.has_method("make_green")):
		#if yes then do it
		collider.make_green()
	if GameStats.pinks_left <= 0:
		$Sprite/WinParticles.visible = true

func set_particle_direction(collider):
	if (collider.has_method("set_particle_direction")):
		collider.set_particle_direction(linear_velocity.normalized() * -1)

func bounce_of(collider):
	if collider.has_method("bouncy"):
		apply_central_impulse(linear_velocity.normalized() * shotspeed / 6)
	if (collider).has_method("spring"):
		apply_central_impulse(Vector2(0, -64))

func aim():
	cameraTransform.global_position = self.global_position + get_local_mouse_position().normalized() * 10
	spawn_trajectory_dots()
	if(Input.is_action_just_released("shoot")):
		cameraTransform.position = Vector2.ZERO + linear_velocity.normalized() * 10
		set_mode(RigidBody2D.MODE_RIGID)
		
		state = FALL
		
		# stop showing arrow
		$Arrow.visible = false
		
		# calculate shot speed and direction
		var direction = get_local_mouse_position().normalized()
		var speed = position.distance_to(get_global_mouse_position())
		speed *= shotspeed / 100
		speed = clamp(speed, 0, 125)
		apply_central_impulse(speed * direction)
		trajectoryTimer.stop()
func _on_TrajectoryTimer_timeout():
	can_spawn_trajectory_dot = true
func spawn_trajectory_dots():
	# spawn trajectory dots
	if (can_spawn_trajectory_dot):	
		var Trajectory = load("res://Ball/Trajectory.tscn")
		var trajectory = Trajectory.instance()
		trajectory.position = position
		var main = get_tree().current_scene
		main.add_child(trajectory)
		# stop infinite dots from spawning
		can_spawn_trajectory_dot = false
	
	if (Input.is_action_just_pressed("shoot")):
		can_spawn_trajectory_dot = true
		trajectoryTimer.start()
func reset_ball():
	GameStats.set_multiplier(1)
	# delete the ball when the level is won, so it doesn't respawn
	if GameStats.level_won:
		queue_free()
	# reset ball
	else:
		rotation = 0
		call_deferred("set", "mode", RigidBody2D.MODE_STATIC)
		call_deferred("set", "position", Vector2(192, 8))
		cameraTransform.position = Vector2.ZERO
		state = RESPAWN
		animation.play("reset")
func reset_done():
	state = AIM
	$Arrow.visible = true
