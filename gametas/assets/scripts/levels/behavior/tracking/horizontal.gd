extends Node

var velocity = Vector2()
onready var entity = get_parent()

export (int) var current = 0
export (bool) var waiting = false

func _track():
	velocity.x = entity.speed.value

func turn():
	entity.speed.value *= -1
	_track()
	
func move():
	current += entity.speed.value
	entity.move_and_slide(velocity)
