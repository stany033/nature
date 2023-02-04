extends Node2D

var dashEnabled = false
var parryEnabled = false
var lastMovementAxis = Vector2.RIGHT

func check_for_dash():
	if Input.is_action_just_pressed("dash") && !dashEnabled:
		stateMachine.travel("dash")
		dashEnabled = true
		parryEnabled = true

func disableParry():
	parryEnabled = false
	
func disableDash():
	dashEnabled = false
	stateMachine.travel("idle")
