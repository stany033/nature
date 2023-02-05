extends State

class_name BulletState

# Hardcodeado. Ya fué
onready var character = get_tree().get_root().get_node("MainGame/YSort/Character")

func _ready():
	print("Shooting")
	animation.travel("bullet")
	
	shootBullet(character.get_node("FirstBullet").get_global_position())
	shootBullet(character.get_node("SecondBullet").get_global_position())
	shootBullet(character.get_node("ThirdBullet").get_global_position())
	
	yield(get_tree().create_timer(0.3), "timeout")
	change_state.call_func("idle")

func shootBullet(bulletPos):
	var projectile = load("res://scenes/characters/Bullet.tscn")
	var bullet = projectile.instance()
	
	add_child_below_node(get_tree().get_root().get_node("MainGame").get_node("YSort"), bullet)
	bullet.set_global_position(bulletPos)
