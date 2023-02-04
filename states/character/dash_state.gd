extends State

class_name DashState

var MAX_SPEED = 400
var ACCELERATION = 4000
var DASH_ACCELERATION_MULT = 2.5
var motion = Vector2.ZERO

func _ready():
	print("Dash!")
	animation_tree.travel("dash")
	if animated_sprite.flip_h:
		motion.x *= -1
	persistent_state.velocity += motion

func _physics_process(_delta):
	move_character(_delta)

func move_character(delta):
	var axis = .get_input_axis()
	if axis == Vector2.ZERO:
		apply_friction((ACCELERATION * 2) * delta)
		if persistent_state.velocity == Vector2.ZERO:
			change_state.call_func("idle")
	else:
		apply_movement(axis * ACCELERATION * delta)
	motion = persistent_state.move_and_slide(motion)

func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else:
		motion = Vector2.ZERO

func apply_movement(acceleration):
	motion += acceleration
	#if dashEnabled:
	#	motion = motion.clamped(MAX_SPEED * DASH_ACCELERATION_MULT)
	#else:
	motion = motion.clamped(MAX_SPEED)
