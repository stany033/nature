extends State

class_name IdleState

func _ready():
	print("Idling")
	animation.travel("idle")

func _flip_direction():
	animated_sprite.flip_h = not animated_sprite.flip_h

func _physics_process(delta):
	# Change to DASH
	if Input.is_action_just_pressed("dash"):
		change_state.call_func("dash")
	# Change to JAB
	if Input.is_action_just_pressed("jab"):
		change_state.call_func("jab")
	# Change to BULLET
	if Input.is_action_just_pressed("bullet"):
		change_state.call_func("bullet")
	# Change to RUN
	elif .get_input_axis(false) != Vector2.ZERO:
		change_state.call_func("run")
	
	

# TO-DO: Move LEFT / RIGHT

#func move_left():
#	if animated_sprite.flip_h:
#		change_state.call_func("run")
#	else:
#		_flip_direction()

#func move_right():
#	if not animated_sprite.flip_h:
#		change_state.call_func("run")
#	else:
#		_flip_direction()
