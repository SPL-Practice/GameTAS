extends "res://addons/godot-behavior-tree-plugin/action.gd"

func tick(tick: Tick) -> int:
	if Input.is_action_pressed("ui_up"):
		tick.actor._up(-1, tick.actor.Run.TOP)
		return OK
	else:
		return FAILED
