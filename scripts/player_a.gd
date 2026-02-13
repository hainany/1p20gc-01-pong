# extends CharacterBody2D
extends AnimatableBody2D


@export var SPEED = 400.0
# const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	var direction := 0
	if Input.is_action_pressed("up_a"):
		direction -= 1
	elif Input.is_action_pressed("down_a"):
		direction += 1
		
	# var direction_a = Input.get_vector("up_a", "down_a", "up_a", "down_a")
	
	# velocity.y = direction * SPEED
	global_position.y += direction * SPEED *delta
	# move_and_slide()
		
