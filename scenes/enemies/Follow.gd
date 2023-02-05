extends Node

class_name Follow

static func follow_player(player, enemy, speed):
	return enemy.direction_to(player) * speed

