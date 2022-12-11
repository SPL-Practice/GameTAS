extends "res://addons/godot-behavior-tree-plugin/action.gd"

func tick(tick: Tick) -> int:
	return FAILED
	if Input.is_action_pressed("ui_down"):
		#tick.actor.up(1)
		#tick.actor.moves.up(-1)
		#var move = tick.actor.moves
		#move.turn(move.Run.DOWN, move.Act.RUN)
		#tick.actor.moves.action(tick.actor.moves.Act.RUN)
		return OK
	return FAILED
