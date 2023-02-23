extends "res://addons/godot-behavior-tree-plugin/action.gd"

var velocity: Vector2 = Vector2.ZERO

func redirect(look, direction: Vector2):
	if direction == Vector2.ZERO:
		#look.perform_passion(1)
		return FAILED
	elif direction == velocity:
		return FAILED
	
	velocity = direction
	look.move(velocity)
	look.perform_passion(0)
	return OK

func tick(tick: Tick) -> int:
	return redirect(tick.actor.look, tick.actor.move())
	
