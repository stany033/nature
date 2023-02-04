extends Node2D

var MAX_SPEED = 400
var ACCELERATION = 4000
var DASH_ACCELERATION_MULT = 2.5
var motion = Vector2.ZERO
var dashEnabled = false
var parryEnabled = false

func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else:
		motion = Vector2.ZERO

func apply_movement(acceleration):
	motion += acceleration
	if dashEnabled:
		motion = motion.clamped(MAX_SPEED * DASH_ACCELERATION_MULT)
	else:
		motion = motion.clamped(MAX_SPEED)

func move_character(delta):
	var axis = get_input_axis()
	if axis == Vector2.ZERO:
		apply_friction((ACCELERATION * 2) * delta)
	else:
		apply_movement(axis * ACCELERATION * delta)
	motion = move_and_slide(motion)
