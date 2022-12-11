extends "res://addons/godot-behavior-tree-plugin/action.gd"

func tick(tick: Tick) -> int:
	var direction = tick.actor.move()
	if direction != Vector2.ZERO:
		tick.actor.moves.move(direction)
		#Input.is_action_pressed("ui_right")
		#var move = tick.actor.moves
		#move.turn(move.Run.RIGHT, move.Act.RUN)
		#tick.actor.moves.action(tick.actor.moves.Act.RUN)
		return OK
	return FAILED
