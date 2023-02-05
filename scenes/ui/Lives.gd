extends HBoxContainer

onready var character = get_tree().get_root().get_node("MainGame/YSort/Character")

func _process(delta):
	
	# In the wise words of Yanderedev:
	# "If only there was an easier way to do this"
	
	# (Disgustingly hard-coded. Whatever. Next time,
	# duplicate a heart in a for-loop
	# for every life you have.)
	
	match character.lives:
		3:
			self.get_node("Heart").visible = true
			self.get_node("Heart2").visible = true
			self.get_node("Heart3").visible = true
		2:
			self.get_node("Heart").visible = true
			self.get_node("Heart2").visible = true
			self.get_node("Heart3").visible = false
		1:
			self.get_node("Heart").visible = true
			self.get_node("Heart2").visible = false
			self.get_node("Heart3").visible = false
		0:
			self.get_node("Heart").visible = false
			self.get_node("Heart2").visible = false
			self.get_node("Heart3").visible = false
