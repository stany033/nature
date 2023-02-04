extends State

class_name RunState

func _ready():
	print("Running")
	animation.travel("run")
	if animated_sprite.flip_h:
		motion.x *= -1
	persistent_state.velocity += motion

func _physics_process(_delta):
	.move_character(_delta, 1, false)

func _process(_delta):
	# Change to DASH
	if Input.is_action_just_pressed("dash"):
		change_state.call_func("dash")
