extends "res://addons/godot-behavior-tree-plugin/action.gd"

func tick(tick: Tick) -> int:
	if tick.actor.path.waiting:
		return FAILED
	else:
		tick.actor.path.move()
		return OK
