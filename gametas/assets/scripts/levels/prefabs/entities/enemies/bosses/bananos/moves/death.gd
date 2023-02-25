extends "res://addons/godot-behavior-tree-plugin/action.gd"

func tick(tick: Tick):
	
	tick.actor.kill()
	return OK
