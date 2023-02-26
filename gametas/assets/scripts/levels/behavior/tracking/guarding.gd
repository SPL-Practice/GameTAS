extends Node2D

onready var entity = get_parent()

export (bool) var waiting = true
var player
	
func move():
	var pos = player.position
	var target = player.position - entity.position
	
	entity.move_and_slide(entity.speed.value * target.normalized())

func _on_enemy_approaching(body):
	if player == null:
		player = body
	waiting = false
	
func _on_enemy_retreat(body):
	waiting = true
