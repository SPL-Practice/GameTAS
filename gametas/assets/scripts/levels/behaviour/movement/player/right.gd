extends "res://addons/godot-behavior-tree-plugin/action.gd"

func tick(tick: Tick) -> int:
	var velocity = tick.actor.move()
	if velocity != Vector2.ZERO:
		tick.actor.look.move(velocity)
		return OK
	else:
		return FAILED
