extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -450.0
@onready var animation = $AnimationPlayer
@onready var sprite = $Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		# Here the problem began because the animation was too short so 
		# I lengthened it in the animation editor, but I also wanted the character when returning to “idle” only to jump.
		animation.play("jump")
		# I added this hoping that by delaying the character's jump it would coincide perfectly with the animation change,
		# but unfortunately after testing the character stopped jumping as high so
		# I had to change “JUMP_VELOCITY” from -400.0 to -450.0
		await get_tree().create_timer(0.099).timeout
		velocity.y = JUMP_VELOCITY 

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if direction == 1:
			sprite.flip_h = false
			animation.play("walk")
		else:
			sprite.flip_h = true
			animation.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation.stop()
		animation.play("idle")
	move_and_slide()
