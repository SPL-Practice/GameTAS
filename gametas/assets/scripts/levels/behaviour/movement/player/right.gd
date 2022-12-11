extends "res://addons/godot-behavior-tree-plugin/action.gd"

func tick(tick: Tick) -> int:
	var result = FAILED
	var direction = tick.actor.move()
	if direction != Vector2.ZERO:
		tick.actor.moves.move(direction)
		result = OK
	return result
