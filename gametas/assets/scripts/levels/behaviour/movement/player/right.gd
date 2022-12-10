extends "res://addons/godot-behavior-tree-plugin/action.gd"

func tick(tick: Tick) -> int:
	if Input.is_action_pressed("ui_right"):
		tick.actor._right(1, tick.actor.Run.RIGHT)
		return OK
	else:
		return FAILED
