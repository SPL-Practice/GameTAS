extends "res://addons/godot-behavior-tree-plugin/action.gd"

var velocity: Vector2

func redirect(look, direction: Vector2):
	if direction == Vector2.ZERO:
		return FAILED
	elif direction == velocity:
		return FAILED
		
	velocity = direction
	look.move(velocity)
	return OK

func tick(tick: Tick) -> int:
	return redirect(tick.actor.look, tick.actor.move())
	
