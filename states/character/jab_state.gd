extends State

class_name JabState

func _ready():
	print("Jabbing")
	animation.travel("jab")
	yield(get_tree().create_timer(0.25), "timeout")
	change_state.call_func("idle")
