extends KinematicBody2D

var player
const speed = 300
var motion = Vector2.ZERO
var isInRange = false

func _physics_process(delta):
	motion = Vector2.ZERO
	if isInRange && player:
		print(player.position)
		motion = position.direction_to(player.position) * speed
	motion = move_and_slide(motion * delta)


func _on_DetectionRange_body_entered(body):
	if body.get_name() == "Character":
		player = body
		isInRange = true
