extends "res://addons/godot-behavior-tree-plugin/action.gd"

func tick(tick: Tick) -> int:
	if Input.is_action_just_pressed("ui_attack"):
		tick.actor.weapon.attack()
		return OK
	return FAILED
