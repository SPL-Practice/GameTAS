extends "res://addons/godot-behavior-tree-plugin/action.gd"

func tick(tick: Tick) -> int:
	return FAILED
	var speed = tick.actor.up(1)
	if speed != 0:
		tick.actor.moves.up(-speed)
		#var move = tick.actor.moves
		#move.turn(move.Run.TOP, move.Act.RUN)
		#tick.actor.moves.action(tick.actor.moves.Act.RUN)
		return OK
	return FAILED
