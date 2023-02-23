extends "res://addons/godot-behavior-tree-plugin/action.gd"

var velocity: Vector2 = Vector2.ZERO

func redirect(look, direction: Vector2):
	if direction == velocity:
		return FAILED
	elif direction == Vector2.ZERO:
		velocity = direction
		look.perform_passion(1)
		return FAILED
		
	velocity = direction
	look.perform_passion(0)
	look.move(direction)
	return OK

func tick(tick: Tick) -> int:
	return redirect(tick.actor.look, tick.actor.move())
	
