extends CharacterBody2D


const SPEED = 300.0
const FLY_ACCELERATION = 3000.0
const MAX_FLY_VELOCITY = -400.0
const FLY_ANGLE = 0.2
const ROTATION_SPEED = 1



@onready var rocket_particles: GPUParticles2D = %RocketParticles
@onready var jetpack_sound: AudioStreamPlayer = $JetpackSound

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_pressed("fly"):
		if not jetpack_sound.playing:
			jetpack_sound.play()
		rocket_particles.emitting = true
		if velocity.y > MAX_FLY_VELOCITY:
			velocity.y -= FLY_ACCELERATION * delta

		if rotation < FLY_ANGLE:
			rotation += ROTATION_SPEED * delta
	else:
		jetpack_sound.stop()
		if rotation > 0:
			rotation -= ROTATION_SPEED * delta


		rocket_particles.emitting = false

	move_and_slide()
