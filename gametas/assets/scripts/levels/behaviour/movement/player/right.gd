extends "res://addons/godot-behavior-tree-plugin/action.gd"

var velocity: Vector2

func redirect(look, direction: Vector2):
	if direction != velocity:
		velocity = direction
		look.move(velocity)
		return OK
	else:
		return FAILED

func tick(tick: Tick) -> int:
	return redirect(tick.actor.look, tick.actor.move())
	
