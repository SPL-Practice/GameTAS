extends AnimatedSprite

onready var tree = $tree

enum behavior { MOVES, SCENE }

func _run_direction(direction):
	
	tree.set("parameters/movement/blend_position", direction)


func move(velocity):
	
	var side = velocity.normalized()
	_run_direction(side)

func scene():
	
	tree.set("parameters/character/current", behavior.SCENE)
