extends Label

func _process(delta):
	var position = Vector2(self.get_position().x, self.get_position().y -1)
	self.set_position(position)
	
	if self.get_position().y < -600:
		self.set_position(Vector2(self.get_position().x, 600))


func _on_Exit_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")
