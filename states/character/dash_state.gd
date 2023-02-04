extends State

class_name DashState

const animationTimer = 0.4
const speedMultiplier = 2.5

func _ready():
	print("Dashing")
	animation.travel("dash")
	yield(get_tree().create_timer(0.4), "timeout")
	change_state.call_func("idle")

func _physics_process(_delta):
	.move_character(_delta, speedMultiplier, true)
