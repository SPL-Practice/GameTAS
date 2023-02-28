extends "res://assets/scripts/levels/behavior/tracking/horizontal.gd"

func _track():
	velocity.y = entity.speed.value
