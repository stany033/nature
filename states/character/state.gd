extends Node2D

class_name State

var change_state
var animated_sprite
var animation
var animation_tree
var persistent_state
var lastMovementAxis = Vector2.RIGHT

var MAX_SPEED = 400
var ACCELERATION = 4000
var motion = Vector2.ZERO

# Writing _delta instead of delta here prevents the unused variable warning.
func _physics_process(_delta):
	persistent_state.move_and_slide(persistent_state.velocity, Vector2.UP)

func setup(change_state, animated_sprite, animation_tree, persistent_state):
	self.change_state = change_state
	self.animated_sprite = animated_sprite
	self.animation = animation_tree.get("parameters/playback")
	self.animation_tree = animation_tree
	self.persistent_state = persistent_state

func get_input_axis(isAutomatic):
	if !isAutomatic:
		var axis = Vector2.ZERO
		axis.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
		axis.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
		lastMovementAxis = axis.normalized()
		return axis.normalized()
	else:
		return lastMovementAxis if lastMovementAxis != Vector2.ZERO else Vector2.RIGHT

func move_character(delta, speedMultiplier, isAutomatic):
	var axis = get_input_axis(isAutomatic)
	if axis == Vector2.ZERO:
		apply_friction((ACCELERATION * 2) * delta)
		
		if persistent_state.velocity == Vector2.ZERO:
			change_state.call_func("idle")
	else:
		apply_movement(axis * ACCELERATION * delta, speedMultiplier)
	motion = persistent_state.move_and_slide(motion)

func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else:
		motion = Vector2.ZERO

func apply_movement(acceleration, speedMultiplier):
	motion += acceleration
	motion = motion.clamped(MAX_SPEED * speedMultiplier)
