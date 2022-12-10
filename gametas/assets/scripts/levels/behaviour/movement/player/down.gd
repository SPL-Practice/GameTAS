extends "res://addons/godot-behavior-tree-plugin/action.gd"

func tick(tick: Tick) -> int:
	if Input.is_action_pressed("ui_down"):
		tick.actor._up(1, tick.actor.Run.DOWN)
		return OK
	else:
		return FAILED
