extends Control

var isMenu = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Play_pressed():
	get_tree().paused = false
	self.queue_free()


func _on_Quit_to_MainMenu_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")
