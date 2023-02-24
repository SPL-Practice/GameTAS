extends "res://addons/godot-behavior-tree-plugin/action.gd"

export (int) var next_hp = 200
onready var phase = get_parent().name

func health_check(tick: Tick) -> int:
	
	if (tick.blackboard.get(phase)):
		return OK
	
	if (tick.actor.health.is_killed()):
		tick.actor.health.max_health = next_hp
		tick.blackboard.set(phase, true)
		return OK
	
	return FAILED


func tick(tick: Tick) -> int:
	
	return health_check(tick)
