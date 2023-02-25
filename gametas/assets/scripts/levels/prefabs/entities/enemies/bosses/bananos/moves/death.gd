extends "res://addons/godot-behavior-tree-plugin/action.gd"

var is_battle_ended = false

func tick(tick: Tick):
	
	if is_battle_ended:
		return OK
		
	is_battle_ended = true
	tick.actor.kill()
	return OK
