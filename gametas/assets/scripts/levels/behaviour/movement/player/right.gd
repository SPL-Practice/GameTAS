extends "res://addons/godot-behavior-tree-plugin/action.gd"

func tick(tick: Tick) -> int:
	if tick.actor.move() != Vector2.ZERO:
		return OK
	else:
		return FAILED
