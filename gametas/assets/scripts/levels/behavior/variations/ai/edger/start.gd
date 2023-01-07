extends "res://addons/godot-behavior-tree-plugin/action.gd"

func tick(tick: Tick) -> int:
	if tick.actor.path.current <= tick.actor.edge.x:
		tick.actor.path.turn()
		return FAILED
	else:
		return OK
